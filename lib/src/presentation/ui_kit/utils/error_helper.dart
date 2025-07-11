import 'package:dio/dio.dart';

abstract class ErrorHelper {
  static String whenError(Object? error, [String? defaultMessage]) {
    if (error is DioException) {
      return error.message ?? 'Неизвестная ошибка';
    }
    return defaultMessage ?? 'Ошибка';
  }
}
