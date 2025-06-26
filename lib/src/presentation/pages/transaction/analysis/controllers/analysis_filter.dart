import 'package:billionaire/src/domain/controllers/analysis_transactions_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analysis_filter.g.dart';
part 'analysis_filter.freezed.dart';

@Riverpod(dependencies: [AnalysisTransactionsRepository])
class AnalysisFilter extends _$AnalysisFilter {
  @override
  AnalysisFilterStateModel build() {
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

    return AnalysisFilterStateModel(
      startDate: ValueNotifier(startDate),
      endDate: ValueNotifier(endDate),
    );
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
        .read(analysisTransactionsRepositoryProvider.notifier)
        .setTransactionsByPeriod(
          startDate: startDate,
          endDate: endDate,
        );
  }
}

@freezed
abstract class AnalysisFilterStateModel with _$AnalysisFilterStateModel {
  const factory AnalysisFilterStateModel({
    required ValueNotifier<DateTime> startDate,
    required ValueNotifier<DateTime> endDate,
  }) = _AnalysisFilterStateModel;
}
