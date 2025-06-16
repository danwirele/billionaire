import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/presentation/pages/transaction/controllers/filtered_transactions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_ammount.g.dart';

@Riverpod(dependencies: [FilteredTransactions])
class TransactionAmmount extends _$TransactionAmmount {
  @override
  Future<double?> build({required bool isIncome}) async {
    final List<TransactionResponseModel>? transactionList = await ref
        .read(
          filteredTransactionsProvider(isIncome: isIncome).future,
        );

    if (transactionList == null) return null;

    final amount = transactionList.fold(
      0.0,
      (previousValue, transaction) =>
          previousValue + double.parse(transaction.amount),
    );

    return amount;
  }
}
