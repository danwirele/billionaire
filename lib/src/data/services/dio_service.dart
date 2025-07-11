import 'dart:developer' show log;
import 'dart:math' show Random, pow;

import 'package:billionaire/core/config/config.dart';
import 'package:billionaire/src/domain/models/account/account_brief_model.dart';
import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/domain/models/account/stat_item_model.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/domain/models/transactions/transaction.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worker_manager/worker_manager.dart';

part 'dio_service.g.dart';

@Riverpod(keepAlive: true)
class DioService extends _$DioService {
  @override
  Dio build() {
    ref.onDispose(() => state.close);

    return Dio()
      ..interceptors.add(
        DeserializationInterceptor(),
      );
  }
}

class DeserializationInterceptor extends Interceptor {
  static const maxRetries = 5;
  static const initialDelay = Duration(seconds: 1);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final newOptions = options.copyWith(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Config.apiKey}',
      },
    );
    handler.next(newOptions);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    try {
      final deserializedResponse = await deserializeData(response);
      handler.next(deserializedResponse);
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          error: e,
        ),
      );
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    int retryCount = 0;

    while (retryCount <= maxRetries) {
      final statusCode = err.response?.statusCode;
      if (statusCode == null) {
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            response: err.response,
            message:
                'Ошибка клиента, пожалуйста, обратитесь в поддержку',
            error:
                'Ошибка клиента, пожалуйста, обратитесь в поддержку',
          ),
        );
      }
      if (![500, 502, 503, 504, 408, 429].contains(statusCode)) {
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            response: err.response,
            message: 'Серверная ошибка',
            error: 'Произошла ошибка выполнения запроса на сервере',
          ),
        );
        break;
      }

      final baseDelay = initialDelay * pow(2, retryCount);
      final jitter = Duration(
        milliseconds: Random().nextInt(baseDelay.inMilliseconds ~/ 2),
      );
      final totalDelay = baseDelay + jitter;

      await Future<void>.delayed(totalDelay);

      retryCount += 1;

      try {
        final requestOptions = err.requestOptions.copyWith();

        final rawResponse = await Dio().fetch(requestOptions);
        final deserializedResponse = await deserializeData(
          rawResponse,
        );
        handler.resolve(deserializedResponse);
        return;
      } catch (e) {
        // Логируем ошибку перед повторной попыткой
        log('Retry #$retryCount failed with error: $e');

        if (retryCount > maxRetries) {
          // Если превышено число попыток — отклоняем запрос
          handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              response: err.response,
              message: 'Ошибка, сервер не отвечает',
              error: 'Ошибка, сервер не отвечает',
            ),
          );
          return;
        }
      }
    }

    // handler.reject(err);
  }

  Future<Response<dynamic>> deserializeData(
    Response<dynamic> response,
  ) async {
    final dtoType = response.requestOptions.extra['dtoType'] as Type?;

    if (dtoType == null) {
      throw ArgumentError(
        'DTO type is not specified in request options',
      );
    }

    final fromJsonFactory = _getFromJsonFactory(dtoType);

    if (fromJsonFactory == null) {
      throw ArgumentError('Unsupported DTO type: $dtoType');
    }

    final rawData = response.data;

    if (rawData is List) {
      final cancelable = workerManager.executeNow(
        (p0) => rawData
            .map(
              (item) => fromJsonFactory(item as Map<String, dynamic>),
            )
            .toList(),
      );

      final deserializedData = await cancelable.future;
      response.data = deserializedData;
      return response;
    } else if (rawData is Map<String, dynamic>) {
      final cancelable = workerManager.execute(
        () => fromJsonFactory(rawData),
      );
      final deserializedData = await cancelable.future;
      response.data = deserializedData;
      return response;
    } else if (rawData == '') {
      return response;
    } else {
      throw FormatException(
        'Unsupported data type: ${rawData.runtimeType}',
      );
    }
  }

  dynamic Function(Map<String, dynamic>)? _getFromJsonFactory(
    Type dtoType,
  ) {
    if (dtoType == AccountModel) {
      return AccountModel.fromJson;
    } else if (dtoType == AccountBriefModel) {
      return AccountBriefModel.fromJson;
    } else if (dtoType == StatItemModel) {
      return StatItemModel.fromJson;
    } else if (dtoType == CategoryModel) {
      return CategoryModel.fromJson;
    } else if (dtoType == TransactionResponseModel) {
      return TransactionResponseModel.fromJson;
    } else if (dtoType == TransactionModel) {
      return TransactionModel.fromJson;
    }
    return null;
  }
}
