part of '../ui_kit.dart';

extension RefExtension on WidgetRef {
  Currency getCurrency() {
    return read(currencyProviderProvider);
  }
}
