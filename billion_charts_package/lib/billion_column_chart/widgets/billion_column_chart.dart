part of '../billion_column_chart_imports.dart';

class BillionColumnBalanceChart extends StatefulWidget {
  const BillionColumnBalanceChart({required this.config, super.key});

  final BillionColumnChartConfig config;

  @override
  _BillionColumnBalanceChartState createState() =>
      _BillionColumnBalanceChartState();
}

class _BillionColumnBalanceChartState
    extends State<BillionColumnBalanceChart> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    final showDaily = widget.config.showDaily;
    final entities = widget.config.entities;

    if (entities.isEmpty) {
      return const Center(
        child: Text(
          'Нет данных для отображения',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    final filteredData = showDaily
        ? entities
        : _getMonthlyData(entities);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: _calculateMaxY(filteredData),
          minY: 0,
          borderData: FlBorderData(show: false),
          groupsSpace: 8,
          gridData: const FlGridData(
            drawHorizontalLine: false,
            show: false,
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= filteredData.length) {
                    return Container();
                  }

                  if (showDaily) {
                    if (index == 0 ||
                        index == (filteredData.length - 1) ||
                        index ==
                            ((filteredData.length / 2).ceil() - 1)) {
                      final date = filteredData[index].date;
                      return Text(
                        '${date.day}.${date.month}',
                        style: const TextStyle(fontSize: 10),
                      );
                    }
                  } else {
                    final date = filteredData[index].date;
                    return Text(
                      '${date.month}.${date.year}',
                      style: const TextStyle(fontSize: 10),
                    );
                  }

                  return Container();
                },
              ),
            ),
            rightTitles: const AxisTitles(),
            leftTitles: const AxisTitles(),
            topTitles: const AxisTitles(),
          ),
          barGroups: filteredData.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final balance = item.balance;
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: balance.abs(),
                  color: balance >= 0 ? Colors.green : Colors.red,
                  width: 6,
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    color: Colors.grey.withAlpha(50),
                    toY: 0,
                    fromY: 0,
                  ),
                ),
              ],
            );
          }).toList(),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              fitInsideHorizontally: true,
              fitInsideVertically: true,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final index = group.x;
                final balance = filteredData[index].balance;

                return BarTooltipItem(
                  balance.toStringAsFixed(2),
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            touchCallback: (event, response) {
              setState(() {
                if (response == null || response.spot == null) {
                  touchedIndex = null;
                } else {
                  touchedIndex = response.spot!.touchedBarGroupIndex;
                }
              });
            },
          ),
        ),
        duration: Duration.zero, // Отключаем анимацию
        curve: Curves.linear, // Используем линейную кривую
      ),
    );
  }

  List<BalanceEntity> _getMonthlyData(List<BalanceEntity> data) {
    final monthlyData = <BalanceEntity>[];
    final groupedByMonth = <String, List<BalanceEntity>>{};

    for (final balanceEntity in data) {
      final date = balanceEntity.date;
      final key = '${date.year}-${date.month}';
      groupedByMonth.putIfAbsent(key, () => []).add(balanceEntity);
    }

    groupedByMonth.forEach((key, items) {
      final lastDay = items.reduce(
        (a, b) => a.date.isAfter(b.date) ? a : b,
      );
      monthlyData.add(lastDay);
    });

    return monthlyData;
  }

  double _calculateMaxY(List<BalanceEntity> data) {
    final maxBalance = data
        .map((e) => e.balance.abs())
        .reduce((a, b) => a > b ? a : b);
    return maxBalance + (maxBalance * 0.1);
  }
}
