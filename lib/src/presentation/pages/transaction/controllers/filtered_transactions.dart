import 'package:billionaire/src/domain/controllers/account_transactions_repository.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_transactions.g.dart';

@Riverpod(keepAlive: true)
class FilteredTransactions extends _$FilteredTransactions {
  @override
  Future<List<TransactionResponseModel>?> build({
    required bool isIncome,
  }) async {
    final transactions = await ref.read(
      transactionsRepositoryProvider(isIncome: isIncome).future,
    );

    if (transactions == null) return null;

    final filteredTransactions = transactions.where(
      (element) => element.category.isIncome == isIncome,
    );

    return filteredTransactions.toList();
  }
}
