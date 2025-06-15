import 'package:intl/intl.dart';

extension NumberExtenstion on double {
  String formatNumber() {
    // Создаем форматтер с русской локалью
    final formatter = NumberFormat.decimalPattern('ru_RU');

    // Форматируем число в строку
    return formatter.format(this);
  }
}
