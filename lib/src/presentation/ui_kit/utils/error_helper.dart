import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

extension ErrorExtension on BuildContext {
  String whenError(Object? error, [String? defaultMessage]) {
    if (error is DioException) {
      return error.message ?? localization.unknownError;
    }
    return defaultMessage ?? localization.error;
  }
}
