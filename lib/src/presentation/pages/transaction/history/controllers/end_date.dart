import 'package:billionaire/src/domain/controllers/history_transactions_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'end_date.g.dart';

@Riverpod()
class EndDateProvider extends _$EndDateProvider {
  @override
  DateTime build() {
    final dateTimeNow = DateTime.now();

    final endDate = DateTime(
      dateTimeNow.year,
      dateTimeNow.month,
      dateTimeNow.day,
      23,
      59,
      59,
    );

    return endDate;
  }

  Future<void> setPeriodEnd({
    required DateTime newDate,
    required DateTime startDate,
  }) async {
    state = newDate;

    await ref
        .read(
          historyTransactionsRepositoryProvider.notifier,
        )
        .setTransactionsByPeriod(
          startDate: startDate,
          endDate: newDate,
        );
  }
}
