import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/history_transactions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_transactions_ammount.g.dart';

@Riverpod(dependencies: [HistoryTransactions])
class HistoryTransactionsAmmount
    extends _$HistoryTransactionsAmmount {
  @override
  Future<double?> build({required bool isIncome}) async {
    final List<TransactionResponseModel>? transactionList = await ref
        .read(historyTransactionsProvider(isIncome: isIncome).future);

    if (transactionList == null) return null;

    final amount = transactionList.fold(
      0.0,
      (previousValue, transaction) =>
          previousValue + double.parse(transaction.amount),
    );

    return amount;
  }
}
