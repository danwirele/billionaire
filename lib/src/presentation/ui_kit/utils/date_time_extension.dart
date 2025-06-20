part of '../ui_kit.dart';

extension DateTimeExtension on DateTime {
  static final toHHmmFormatter = DateFormat('HH:mm');
  static final toddMMyyyyFormatter = DateFormat('dd.MM.yyyy');

  String toHHmm() {
    return toHHmmFormatter.format(this);
  }

  String toddMMyyyy() {
    return toddMMyyyyFormatter.format(this);
  }
}
