import 'package:billionaire/core/enum/filter_option.dart';
import 'package:billionaire/src/domain/controllers/history_transactions_repository.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/transaction_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_transactions.g.dart';
part 'history_transactions.freezed.dart';

@Riverpod(
  dependencies: [HistoryTransactionsRepository, TransactionFilter],
)
class HistoryTransactions extends _$HistoryTransactions {
  @override
  Future<HistoryTransactionStateModel?> build({
    required bool isIncome,
  }) async {
    final transactions = await ref.read(
      historyTransactionsRepositoryProvider.future,
    );

    if (transactions == null) return null;

    final filter = ref.watch(transactionFilterProvider);

    final List<TransactionResponseModel> filteredTransactions = [];
    double amount = 0;

    for (final transaction in transactions) {
      if (transaction.category.isIncome == isIncome) {
        filteredTransactions.add(transaction);
        amount += double.parse(transaction.amount);
      }
    }

    if (filter != null) {
      switch (filter.filterOption) {
        case FilterOption.dateAscending:
          filteredTransactions.sort(
            (a, b) => a.transactionDate.compareTo(b.transactionDate),
          );
        case FilterOption.dateDescending:
          filteredTransactions.sort(
            (a, b) => b.transactionDate.compareTo(a.transactionDate),
          );
        case FilterOption.priceAscending:
          filteredTransactions.sort((a, b) {
            final priceA = double.parse(a.amount);
            final priceB = double.parse(b.amount);
            return priceA.compareTo(priceB);
          });
        case FilterOption.priceDescending:
          filteredTransactions.sort((a, b) {
            final priceA = double.parse(a.amount);
            final priceB = double.parse(b.amount);
            return priceB.compareTo(priceA);
          });
      }
    }

    return HistoryTransactionStateModel(
      transactions: filteredTransactions,
      amount: amount,
    );
  }
}

@freezed
abstract class HistoryTransactionStateModel with _$HistoryTransactionStateModel {
  const factory HistoryTransactionStateModel({
    required List<TransactionResponseModel> transactions,
    required double amount,
  }) = _HistoryTransactionStateModel;
}
