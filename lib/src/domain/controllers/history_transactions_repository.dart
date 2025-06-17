import 'package:billionaire/src/data/remote/mock_repository_impl/mock_transaction_repository_impl.dart';
import 'package:billionaire/src/domain/controllers/user_account_repository.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/domain/repositories/transaction_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_transactions_repository.g.dart';

@Riverpod(dependencies: [UserAccountRepository])
class HistoryTransactionsRepository
    extends _$HistoryTransactionsRepository {
  static final TransactionRepository transactionRepo =
      MockTransactionRepositoryImpl();

  @override
  Future<List<TransactionResponseModel>?> build() async {
    final account = await ref.watch(
      userAccountRepositoryProvider.future,
    );

    if (account == null) return null;
    final dateTimeNow = DateTime.now();
    // Начало текущего дня
    final startDate = DateTime(
      dateTimeNow.year,
      dateTimeNow.month,
      dateTimeNow.day,
    );

    // Конец текущего дня
    final endDate = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
      23,
      59,
      59,
    );

    final transactions = await transactionRepo
        .getTransactionsByPeriod(
          accountId: account.id,
          startDate: startDate,
          endDate: endDate,
        );

    return transactions;
  }

  Future<void> setTransactionsByPeriod({
    required DateTime startDate,
    required DateTime endDate,
    required bool isIncome,
  }) async {
    state = const AsyncLoading();
    final account = await ref.read(
      userAccountRepositoryProvider.future,
    );

    if (account == null) {
      state = AsyncError(
        'Ошибка, счета не существует',
        StackTrace.current,
      );

      return;
    }

    final transactions = await transactionRepo
        .getTransactionsByPeriod(
          accountId: account.id,
          startDate: startDate,
          endDate: endDate,
        );

    final filteredTransactions = transactions.where(
      (element) => element.category.isIncome == isIncome,
    );

    state = AsyncData(filteredTransactions.toList());
  }
}
