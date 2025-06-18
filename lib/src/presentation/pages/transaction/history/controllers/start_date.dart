import 'package:billionaire/src/domain/controllers/history_transactions_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'start_date.g.dart';

@riverpod
class StartDateProvider extends _$StartDateProvider {
  @override
  DateTime build() {
    final dateTimeNow = DateTime.now();
    // Начало текущего дня
    final startDate = DateTime(
      dateTimeNow.year,
      dateTimeNow.month - 1,
      dateTimeNow.day,
    );

    return startDate;
  }

  Future<void> setPeriodStart({
    required DateTime newDate,
    required DateTime endDate,
  }) async {
    state = newDate;

    await ref
        .read(
          historyTransactionsRepositoryProvider.notifier,
        )
        .setTransactionsByPeriod(
          startDate: newDate,
          endDate: endDate,
        );
  }
}
