import 'package:billionaire/src/domain/controllers/transactions_repository.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_transactions.g.dart';
part 'filtered_transactions.freezed.dart';

@riverpod
class FilteredTransactions extends _$FilteredTransactions {
  @override
  Future<TransactionStateModel?> build({
    required bool isIncome,
  }) async {
    final transactions = await ref.watch(
      transactionsRepositoryProvider.future,
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

    return TransactionStateModel(
      transactions: filteredTransactions,
      amount: amount,
    );
  }
}

@freezed
abstract class TransactionStateModel with _$TransactionStateModel {
  const factory TransactionStateModel({
    required List<TransactionResponseModel> transactions,
    required double amount,
  }) = _TransactionStateModel;
}
