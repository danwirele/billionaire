import 'package:billionaire/src/data/datasources/local/transaction_local_datasource.dart';
import 'package:billionaire/src/data/datasources/remote/transaction_datasource.dart';
import 'package:billionaire/src/data/db/db_service.dart';
import 'package:billionaire/src/data/db/events_datasource/transaction_event_datasource.dart';
import 'package:billionaire/src/data/repositories/impl/transaction_repository_impl.dart';
import 'package:billionaire/src/data/utils/dio_service.dart';
import 'package:billionaire/src/domain/controllers/user_account_repository.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_request.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/domain/repositories/transaction_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transactions_repository.g.dart';

@Riverpod(dependencies: [UserAccountRepository])
class TransactionsRepository extends _$TransactionsRepository {
  //TODO отладить почему не инициализировано
  late final TransactionRepository transactionRepo;

  @override
  Future<List<TransactionResponseModel>?> build() async {
    final database = await ref.read(dbServiceProvider.future);
    final dio = ref.read(dioServiceProvider);

    transactionRepo = TransactionRepositoryImpl(
      database: database,
      remoteDatasource: TransactionDatasourceImpl(dio: dio),
      localEventDatasource: TransactionEventDatasource(
        database: database,
      ),
      localDatasource: TransactionLocalDatasourceImpl(
        database: database,
      ),
    );

    final account = await ref.watch(
      userAccountRepositoryProvider.future,
    );

    if (account == null) return null;

    //TODO! Сделай екстеншен
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

  Future<void> createTransaction({
    required TransactionRequestModel newModel,
  }) async {
    await transactionRepo.createTransaction(newModel);
  }

  Future<void> updateTransaction({
    required int id,
    required TransactionRequestModel newModel,
  }) async {
    await transactionRepo.updateTransaction(
      id: id,
      updatedModel: newModel,
    );
  }
}
