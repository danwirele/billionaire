part of '../billion_column_chart_imports.dart';

class BillionColumnChartConfig {
  const BillionColumnChartConfig({
    required this.entities,
    required this.showDaily,
  });

  final List<BalanceEntity> entities;
  final bool showDaily;
}
