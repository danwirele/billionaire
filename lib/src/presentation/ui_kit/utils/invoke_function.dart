import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

extension InvokeFunction on BuildContext {
  Future<void> invokeMethodWrapper(
    Future<dynamic> Function() future,
  ) async {
    try {
      return await future.call();
    } on DioException catch (e) {
      await showDialog(
        context: this,
        builder: (context) {
          return AlertDialog(
            title: BillionText.titleLarge(
              context.localization.sorryErrorOccurred,
            ),
            content: BillionText.bodyMedium(
              e.message.toString(),
              overflow: TextOverflow.visible,
            ),
            actions: [
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: Text(context.localization.close),
              ),
            ],
          );
        },
      );
    } catch (e) {
      await showDialog(
        context: this,
        builder: (context) {
          return AlertDialog(
            title: BillionText.titleLarge(
              context.localization.sorryErrorOccurred,
            ),
            content: BillionText.bodyMedium(
              context.localization.contactSupport,
              overflow: TextOverflow.visible,
            ),
            actions: [
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: Text(context.localization.close),
              ),
            ],
          );
        },
      );
    }
  }
}
