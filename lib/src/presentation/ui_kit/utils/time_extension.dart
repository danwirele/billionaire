import 'package:intl/intl.dart';

extension TimeExtension on DateTime {
  String toHHmm() {
    // Создаем форматтер для времени в формате "HH:mm"
    final formatter = DateFormat('HH:mm');

    // Форматируем дату в строку
    return formatter.format(this);
  }

  String toddMMyyyy() {
    final formatter = DateFormat('dd.MM.yyyy');

    // Форматируем дату в строку
    return formatter.format(this);
  }
}
