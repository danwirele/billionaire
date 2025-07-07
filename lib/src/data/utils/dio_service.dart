import 'package:billionaire/src/domain/models/account/account_brief_model.dart';
import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/domain/models/account/account_response_model.dart';
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
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    try {
      // Получаем тип DTO из тегов запроса
      final dtoType = response.requestOptions.extra['dtoType'] as Type?;
      if (dtoType == null) {
        throw ArgumentError('DTO type is not specified in request options');
      }

      // Получаем фабричный метод для DTO
      final fromJsonFactory = _getFromJsonFactory(dtoType);

      if (fromJsonFactory == null) {
        throw ArgumentError('Unsupported DTO type: $dtoType');
      }

      final rawData = response.data;

      if (rawData is List) {
        // Если данные — список, преобразуем каждый элемент в DTO
        final cancelable = workerManager.execute<List<dynamic>>(
          () => rawData.map((item) => fromJsonFactory(item as Map<String, dynamic>)).toList(),
          priority: WorkPriority.immediately,
        );

        final deserializedData = await cancelable.future;
        response.data = deserializedData;
      } else if (rawData is Map<String, dynamic>) {
        // Если данные — словарь, преобразуем их в DTO
        final cancelable = workerManager.execute<dynamic>(
          () => fromJsonFactory(rawData),
          priority: WorkPriority.immediately,
        );

        final deserializedData = await cancelable.future;
        response.data = deserializedData;
      } else {
        throw FormatException('Unsupported data type: ${rawData.runtimeType}');
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

    handler.next(response);
  }

  // Вспомогательный метод для получения фабричного метода по типу DTO
  dynamic Function(Map<String, dynamic>)? _getFromJsonFactory(Type dtoType) {
    if (dtoType == AccountModel) {
      return (json) => AccountModel.fromJson(json);
    } else if (dtoType == AccountBriefModel) {
      return (json) => AccountResponseModel.fromJson(json);
    } else if (dtoType == StatItemModel) {
      return (json) => StatItemModel.fromJson(json);
    } else if (dtoType == CategoryModel) {
      return (json) => CategoryModel.fromJson(json);
    } else if (dtoType == TransactionResponseModel) {
      return (json) => TransactionResponseModel.fromJson(json);
    } else if (dtoType == TransactionModel) {
      return (json) => TransactionModel.fromJson(json);
    }
    return null;
  }
}
