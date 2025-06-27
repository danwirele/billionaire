import 'package:billionaire/src/domain/controllers/history_transactions_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date.g.dart';
part 'date.freezed.dart';

@riverpod
class Date extends _$Date {
  @override
  DateStateModel build() {
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

    ref.onDispose(
      () {
        state.startDate.dispose();
        state.endDate.dispose();
      },
    );

    return DateStateModel(startDate: ValueNotifier(startDate), endDate: ValueNotifier(endDate));
  }

  Future<void> setStartDate(DateTime newStartDate) async {
    final currentEndDate = state.endDate.value;

    if (newStartDate.isAfter(state.endDate.value)) {
      final updatedEndDate = DateTime(
        newStartDate.year,
        newStartDate.month,
        newStartDate.day,
        23,
        59,
        59,
      );

      state.startDate.value = newStartDate;
      state.endDate.value = updatedEndDate;

      await _updateRepository(newStartDate, updatedEndDate);
    } else {
      state.startDate.value = newStartDate;
      state.endDate.value = currentEndDate;
      await _updateRepository(newStartDate, currentEndDate);
    }
  }

  Future<void> setEndDate(DateTime newEndDate) async {
    final currentStartDate = state.startDate.value;

    final updatedEndDate = DateTime(
      newEndDate.year,
      newEndDate.month,
      newEndDate.day,
      23,
      59,
      59,
    );

    if (updatedEndDate.isBefore(currentStartDate)) {
      state.startDate.value = updatedEndDate;
      state.endDate.value = updatedEndDate;
      await _updateRepository(updatedEndDate, updatedEndDate);
    } else {
      state.startDate.value = currentStartDate;
      state.endDate.value = updatedEndDate;
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

@freezed
abstract class DateStateModel with _$DateStateModel {
  const factory DateStateModel({
    required ValueNotifier<DateTime> startDate,
    required ValueNotifier<DateTime> endDate,
  }) = _DateStateModel;
}
