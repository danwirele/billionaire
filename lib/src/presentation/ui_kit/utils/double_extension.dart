part of '../ui_kit.dart';

extension DoubleExtenstion on double {
  static final decimalPatternFormatter = NumberFormat.decimalPattern(
    'ru_RU',
  );
  //TODO! THINK
  String formatNumber() {
    return decimalPatternFormatter.format(this);
  }
}
