import 'package:billionaire/src/data/db/db_service.dart';
import 'package:billionaire/src/data/services/dio_service.dart';
import 'package:billionaire/src/domain/controllers/user_account_repository.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_request.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/domain/repo_impl_provider/transaction_repository_impl_di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transactions_repository.g.dart';

@Riverpod(
  dependencies: [UserAccountRepository, DbService, DioService],
)
class TransactionsRepository extends _$TransactionsRepository {
  @override
  Future<List<TransactionResponseModel>?> build() async {
    final transactions = getTransactionsByPeriod();

    return transactions;
  }

  Future<void> createTransaction({
    required TransactionRequestModel newModel,
  }) async {
    final transactionRepo = await ref.read(
      transactionRepositoryImplDiProvider.future,
    );
    await transactionRepo.createTransaction(newModel);

    final transactions = await getTransactionsByPeriod();
    state = AsyncData(transactions);
  }

  Future<void> updateTransaction({
    required int id,
    required TransactionRequestModel newModel,
  }) async {
    final transactionRepo = await ref.read(
      transactionRepositoryImplDiProvider.future,
    );
    await transactionRepo.updateTransaction(
      id: id,
      updatedModel: newModel,
    );
    final transactions = await getTransactionsByPeriod();
    state = AsyncData(transactions);
  }

  Future<void> deleteTransaction({
    required int id,
  }) async {
    final transactionRepo = await ref.read(
      transactionRepositoryImplDiProvider.future,
    );
    await transactionRepo.deleteTransaction(id: id);
  }

  Future<List<TransactionResponseModel>?>
  getTransactionsByPeriod() async {
    final transactionRepo = await ref.read(
      transactionRepositoryImplDiProvider.future,
    );

    final account = await ref.read(
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

    return transactionRepo.getTransactionsByPeriod(
      accountId: account.id,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
