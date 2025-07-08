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
}
