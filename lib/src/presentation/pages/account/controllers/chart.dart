import 'package:billion_charts_package/billion_column_chart/billion_column_chart_imports.dart';
import 'package:billionaire/src/domain/controllers/chart_transactions_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chart.g.dart';

@Riverpod(dependencies: [ChartTransactionsRepository])
class Chart extends _$Chart {
  @override
  FutureOr<List<BalanceEntity>> build() async {
    final chartTransaction = await ref.watch(
      chartTransactionsRepositoryProvider.future,
    );

    if (chartTransaction == null) return [];

    final Map<DateTime, double> groupByDate = {};

    for (final transaction in chartTransaction) {
      final key = transaction.transactionDate.copyWith(
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

      if (!groupByDate.containsKey(key)) {
        groupByDate[key] = double.parse(transaction.amount);
      } else {
        groupByDate[key] =
            groupByDate[key]! + double.parse(transaction.amount);
      }
    }

    final List<BalanceEntity> groupedList = groupByDate.entries
        .map(
          (element) => BalanceEntity(
            date: element.key,
            balance: element.value,
          ),
        )
        .toList();

    return groupedList;
  }

  Future<void> getCurrentMonthTransactions() async {
    final dateTimeNow = DateTime.now();
    // Начало текущего дня
    final startDate = DateTime(
      dateTimeNow.year,
      dateTimeNow.month - 1,
      dateTimeNow.day,
    );

    // Конец текущего дня
    final endDate = DateTime(
      dateTimeNow.year,
      dateTimeNow.month,
      dateTimeNow.day,
      23,
      59,
      59,
    );
    await ref
        .read(
          chartTransactionsRepositoryProvider.notifier,
        )
        .setTransactionsByPeriod(
          startDate: startDate,
          endDate: endDate,
        );
  }

  Future<void> getYearTransactions() async {
    final dateTimeNow = DateTime.now();
    final startDate = DateTime(
      dateTimeNow.year - 1,
      dateTimeNow.month,
      dateTimeNow.day,
    );

    // Конец текущего дня
    final endDate = DateTime(
      dateTimeNow.year,
      dateTimeNow.month,
      dateTimeNow.day,
      23,
      59,
      59,
    );
    await ref
        .read(
          chartTransactionsRepositoryProvider.notifier,
        )
        .setTransactionsByPeriod(
          startDate: startDate,
          endDate: endDate,
        );
  }
}
