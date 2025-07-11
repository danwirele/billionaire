part of '../billion_column_chart_imports.dart';

class BalanceEntity {
  const BalanceEntity({required this.date, required this.balance});

  final DateTime date;
  final double balance;

  @override
  String toString() {
    return 'BalanceEntity(date: $date, balance: $balance)';
  }
}
