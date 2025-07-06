import 'dart:convert';
import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/domain/models/account/account_response_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worker_manager/worker_manager.dart';

part 'dio_service.g.dart';

@Riverpod(keepAlive: true)
class DioService extends _$DioService {
  @override
  Dio build() {
    ref.onDispose(() => state.close);

    return Dio();
    // ..interceptors.add(
    //   DeserializationInterceptor<AccountModel>(
    //     fromJsonFactory: (p0) => AccountResponseModel.fromJson(p0),
    //   ),
    // );
  }
}

// Класс интерсептора для десериализации
class DeserializationInterceptor<T> extends Interceptor {
  DeserializationInterceptor({required this.fromJsonFactory});

  final T Function(Map<String, dynamic>) fromJsonFactory;

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    try {
      final rawData = response.data;

      if (rawData is List) {
        // Если данные — список, преобразуем каждый элемент в DTO
        final cancelable = workerManager.execute<List<T>>(
          () => rawData
              .map(
                (item) =>
                    fromJsonFactory(item as Map<String, dynamic>),
              )
              .toList(),
          priority: WorkPriority.immediately,
        );

        final deserializedData = await cancelable.future;
        response.data = deserializedData;
      } else if (rawData is Map<String, dynamic>) {
        // Если данные — словарь, преобразуем их в DTO
        final cancelable = workerManager.execute<T>(
          () => fromJsonFactory(rawData),
          priority: WorkPriority.immediately,
        );

        final deserializedData = await cancelable.future;
        response.data = deserializedData;
      } else {
        throw FormatException(
          "Unsupported data type: ${rawData.runtimeType}",
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

    handler.next(response);
  }
}

dynamic _deserializeJson(String jsonData) {
  // Здесь может быть сложная логика десериализации
  return jsonDecode(jsonData);
}
