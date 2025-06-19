import 'package:billionaire/src/domain/controllers/history_transactions_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date.g.dart';

@riverpod
class Date extends _$Date {
  @override
  (DateTime startDate, DateTime endDate) build() {
    final dateTimeNow = DateTime.now();

    final endDate = DateTime(
      dateTimeNow.year,
      dateTimeNow.month,
      dateTimeNow.day,
      23,
      59,
      59,
    );

    final startDate = DateTime(
      dateTimeNow.year,
      dateTimeNow.month - 1,
      dateTimeNow.day,
    );

    return (startDate, endDate);
  }

  Future<void> setStartDate(DateTime newStartDate) async {
    final currentEndDate = state.$2;

    if (newStartDate.isAfter(currentEndDate)) {
      final updatedEndDate = DateTime(
        newStartDate.year,
        newStartDate.month,
        newStartDate.day,
        23,
        59,
        59,
      );

      state = (newStartDate, updatedEndDate);

      await _updateRepository(newStartDate, updatedEndDate);
    } else {
      state = (newStartDate, currentEndDate);

      await _updateRepository(newStartDate, currentEndDate);
    }
  }

  Future<void> setEndDate(DateTime newEndDate) async {
    final currentStartDate = state.$1;

    final updatedEndDate = DateTime(
      newEndDate.year,
      newEndDate.month,
      newEndDate.day,
      23,
      59,
      59,
    );

    if (updatedEndDate.isBefore(currentStartDate)) {
      state = (updatedEndDate, updatedEndDate);

      await _updateRepository(updatedEndDate, updatedEndDate);
    } else {
      state = (currentStartDate, updatedEndDate);

      await _updateRepository(currentStartDate, updatedEndDate);
    }
  }

  Future<void> _updateRepository(
    DateTime startDate,
    DateTime endDate,
  ) async {
    await ref
        .read(historyTransactionsRepositoryProvider.notifier)
        .setTransactionsByPeriod(
          startDate: startDate,
          endDate: endDate,
        );
  }
}
