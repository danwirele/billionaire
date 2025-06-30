part of '../billion_pie_chart_imports.dart';

class BillionPieChartConfig {
  BillionPieChartConfig({required this.legends, this.radius = 65})
    : assert(
        legends.fold(0, (previousValue, element) {
              return previousValue + element.percentage.ceil();
            }) ==
            100,
        'incomePercentage & expensePercentage summary need to bee 100%',
      ),
      assert(
        legends.length <= 8 && legends.isNotEmpty,
        'legentds.length must be <= 8',
      );

  final double radius;
  final List<LegendEntity> legends;
}
