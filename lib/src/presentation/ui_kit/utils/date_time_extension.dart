part of '../ui_kit.dart';

extension DateTimeExtension on DateTime {
  static final _toHHmmFormatter = DateFormat('HH:mm');
  static final _toddMMyyyyFormatter = DateFormat('dd.MM.yyyy');
  static final _toYYYYMMddFormatter = DateFormat('yyyy-MM-dd');

  String toHHmm() {
    return _toHHmmFormatter.format(this);
  }

  String toddMMyyyy() {
    return _toddMMyyyyFormatter.format(this);
  }

  String toYYYYMMdd() {
    return _toYYYYMMddFormatter.format(this);
  }

  DateTime todayStartDay() {
    final dateTimeNow = DateTime.now();
    // Начало текущего дня
    return DateTime(
      dateTimeNow.year,
      dateTimeNow.month,
      dateTimeNow.day,
    );
  }

  DateTime todayEndDay() {
    final dateTimeNow = DateTime.now();
    // Конец текущего дня
    return DateTime(
      dateTimeNow.year,
      dateTimeNow.month,
      dateTimeNow.day,
      23,
      59,
      59,
    );
  }
}
