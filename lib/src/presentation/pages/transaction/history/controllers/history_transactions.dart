import 'package:billionaire/src/data/remote/mock_repository_impl/mock_transaction_repository_impl.dart';
import 'package:billionaire/src/domain/controllers/history_transactions_repository.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/domain/repositories/transaction_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_transactions.g.dart';
part 'history_transactions.freezed.dart';

@Riverpod(dependencies: [HistoryTransactionsRepository])
class HistoryTransactions extends _$HistoryTransactions {
  static final TransactionRepository transactionRepo =
      MockTransactionRepositoryImpl();

  @override
  Future<HistoryTransactionStateModel?> build({
    required bool isIncome,
  }) async {
    final transactions = await ref.watch(
      historyTransactionsRepositoryProvider.future,
    );

    if (transactions == null) return null;

    final List<TransactionResponseModel> filteredTransactions = [];
    double amount = 0;

    for (final transaction in transactions) {
      if (transaction.category.isIncome == isIncome) {
        filteredTransactions.add(transaction);
        amount += double.parse(transaction.amount);
      }
    }

    return HistoryTransactionStateModel(
      transactions: filteredTransactions,
      amount: amount,
    );
  }

  Future<void> sortBy() async {}
}

@freezed
abstract class HistoryTransactionStateModel
    with _$HistoryTransactionStateModel {
  const factory HistoryTransactionStateModel({
    required List<TransactionResponseModel> transactions,
    required double amount,
  }) = _HistoryTransactionStateModel;
}
