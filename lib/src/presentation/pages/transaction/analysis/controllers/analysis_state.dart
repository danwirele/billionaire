import 'package:billionaire/src/domain/controllers/analysis_transactions_repository.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analysis_state.freezed.dart';
part 'analysis_state.g.dart';

@Riverpod(dependencies: [AnalysisTransactionsRepository])
class AnalysisState extends _$AnalysisState {
  @override
  FutureOr<AnalyticsPageStateModel?> build({
    required bool isIncome,
  }) async {
    final transactions = await ref.watch(
      analysisTransactionsRepositoryProvider.future,
    );

    if (transactions == null) return null;

    final filtered = transactions.where((c) => c.category.isIncome == isIncome).toList();

    final fullAmount = filtered.map((c) => double.parse(c.amount)).reduce((a, b) => a + b);

    final categoryMap = <CategoryModel, List<TransactionResponseModel>>{};
    for (final transaction in filtered) {
      if (!categoryMap.containsKey(transaction.category)) {
        categoryMap[transaction.category] = [];
      }
      categoryMap[transaction.category]!.add(transaction);
    }

    final analysis = categoryMap.entries.map((e) {
      final amount = e.value.map((c) => double.parse(c.amount)).reduce((a, b) => a + b);
      final last = e.value.last;
      final percentage = (amount / fullAmount) * 100;

      return AnalyticsStateModel(
        category: e.key,
        lastTransactionComment: last.comment,
        transactions: e.value,
        amount: amount,
        percentage: percentage,
      );
    }).toList();

    final summaryAmount = analysis.fold(
      0.0,
      (previousValue, element) => previousValue + element.amount,
    );

    return AnalyticsPageStateModel(
      stateModelsList: analysis,
      summaryAmount: summaryAmount,
    );
  }
}

@freezed
abstract class AnalyticsPageStateModel with _$AnalyticsPageStateModel {
  const factory AnalyticsPageStateModel({
    required List<AnalyticsStateModel> stateModelsList,
    required double summaryAmount,
  }) = _AnalyticsPageStateModel;
}

@freezed
abstract class AnalyticsStateModel with _$AnalyticsStateModel {
  const factory AnalyticsStateModel({
    required CategoryModel category,
    required String? lastTransactionComment,
    required List<TransactionResponseModel> transactions,
    required double amount,
    required double percentage,
  }) = _AnalyticsStateModel;
}
