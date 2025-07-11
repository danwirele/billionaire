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
    super.onRequest(newOptions, handler);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    try {
      final dtoType =
          response.requestOptions.extra['dtoType'] as Type?;

      if (dtoType == null) {
        throw ArgumentError(
          'DTO type is not specified in request options',
        );
      }

      // Получаем фабричный метод для DTO
      final fromJsonFactory = _getFromJsonFactory(dtoType);

      if (fromJsonFactory == null) {
        throw ArgumentError('Unsupported DTO type: $dtoType');
      }

      final rawData = response.data;

      if (rawData is List) {
        // Если данные — список, преобразуем каждый элемент в DTO
        final cancelable = workerManager.executeNow(
          (p0) => rawData
              .map(
                (item) =>
                    fromJsonFactory(item as Map<String, dynamic>),
              )
              .toList(),
        );

        final deserializedData = await cancelable.future;
        response.data = deserializedData;

        handler.next(response);
      } else if (rawData is Map<String, dynamic>) {
        // Если данные — словарь, преобразуем их в DTO
        final cancelable = workerManager.execute(
          () => fromJsonFactory(rawData),
          priority: WorkPriority.immediately,
        );

        final deserializedData = await cancelable.future;
        response.data = deserializedData;
        handler.next(response);
      } else if (rawData == '') {
        handler.next(response);
      } else {
        throw FormatException(
          'Unsupported data type: ${rawData.runtimeType}',
        );
      }
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          error: e,
        ),
      );
      return;
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
