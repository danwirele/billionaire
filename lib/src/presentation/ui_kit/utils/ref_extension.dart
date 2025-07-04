part of '../ui_kit.dart';

extension WidgetRefExtension on WidgetRef {
  Currency getCurrency() {
    return read(currencyProviderProvider);
  }
}
