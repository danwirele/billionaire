import 'package:billionaire/src/domain/controllers/user_account_repository.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/domain/repo_impl_provider/transaction_repository_impl_di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analysis_transactions_repository.g.dart';

@Riverpod(dependencies: [UserAccountRepository])
class AnalysisTransactionsRepository
    extends _$AnalysisTransactionsRepository {
  @override
  Future<List<TransactionResponseModel>?> build() async {
    final transactionRepo = await ref.read(
      transactionRepositoryImplDiProvider.future,
    );

    final account = await ref.watch(
      userAccountRepositoryProvider.future,
    );

    if (account == null) return null;

    final dateTimeNow = DateTime.now();
    // Начало текущего дня
    final startDate = DateTime(
      dateTimeNow.year,
      dateTimeNow.month - 1,
      dateTimeNow.day,
    );

    // Конец текущего дня
    final endDate = DateTime(
      dateTimeNow.year,
      dateTimeNow.month,
      dateTimeNow.day,
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
  }) async {
    state = const AsyncLoading();

    final transactionRepo = await ref.read(
      transactionRepositoryImplDiProvider.future,
    );

    final account = await ref.read(
      userAccountRepositoryProvider.future,
    );

    if (account == null) return;

    final transactions = await transactionRepo
        .getTransactionsByPeriod(
          accountId: account.id,
          startDate: startDate,
          endDate: endDate,
        );

    state = AsyncData(transactions);
  }
}
