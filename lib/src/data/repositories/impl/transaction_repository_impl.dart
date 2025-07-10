import 'package:billionaire/core/utils/conecction_extension.dart';
import 'package:billionaire/src/data/datasources/local/transaction_local_datasource.dart';
import 'package:billionaire/src/data/datasources/remote/transaction_datasource.dart';
import 'package:billionaire/src/data/db/db.dart';
import 'package:billionaire/src/data/db/events_datasource/transaction_event_datasource.dart';
import 'package:billionaire/src/domain/models/account/account_brief_model.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/domain/models/transactions/transaction.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_request.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/domain/repositories/transaction_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl({
    required this.remoteDatasource,
    required this.localEventDatasource,
    required this.localDatasource,
    required this.database,
  });

  static final Connectivity connectivity = Connectivity();

  final TransactionDatasource remoteDatasource;
  final TransactionEventDatasource localEventDatasource;
  final TransactionLocalDatasource localDatasource;

  final Database database;

  @override
  Future<TransactionModel?> createTransaction(
    TransactionRequestModel model,
  ) async {
    final hasConnection = await connectivity.hasConnection();

    if (hasConnection) {
      // Если есть подключение, создаем транзакцию через datasource
      return remoteDatasource.createTransaction(model);
    } else {
      // Если нет подключения, сохраняем событие в локальную базу
      final event = CreateTransactionEventTableCompanion(
        accountId: Value(model.accountId),
        categoryId: Value(model.categoryId),
        amount: Value(model.amount),
        transactionDate: Value(model.transactionDate),
        comment: Value(model.comment),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );

      await TransactionEventDatasource(
        database: database,
      ).addCreateTransactionEvent(event);

      return null; // Возвращаем null, так как транзакция не создана на сервере
    }
  }

  @override
  Future<void> deleteTransaction({
    required int id,
  }) async {
    final hasConnection = await connectivity.hasConnection();

    if (hasConnection) {
      // Если есть подключение, удаляем транзакцию через datasource
      await remoteDatasource.deleteTransaction(
        id: id,
      );
    } else {
      // Если нет подключения, сохраняем событие удаления в локальную базу

      final event = DeleteTransactionEventTableCompanion(
        id: Value(id),
      );
      await TransactionEventDatasource(
        database: database,
      ).addDeleteTransactionEvent(event);
    }
  }

  @override
  Future<TransactionResponseModel> getTransactionById(int id) async {
    final hasConnection = await connectivity.hasConnection();

    if (hasConnection) {
      // Если есть подключение, получаем транзакцию через datasource
      return remoteDatasource.getTransactionById(id);
    } else {
      final query = database.selectOnly(database.transactionTable)
        ..addColumns([
          database.transactionTable.id,
          database.transactionTable.amount,
          database.transactionTable.transactionDate,
          database.transactionTable.createdAt,
          database.transactionTable.updatedAt,
          database.transactionTable.comment,
          database.accountTable.id,
          database.accountTable.name,
          database.accountTable.balance,
          database.accountTable.currency,
          database.categoryTable.id,
          database.categoryTable.name,
          database.categoryTable.emoji,
          database.categoryTable.isIncome,
        ])
        ..join([
          innerJoin(
            database.accountTable,
            database.accountTable.id.equalsExp(
              database.transactionTable.accountId,
            ),
          ),
          innerJoin(
            database.categoryTable,
            database.categoryTable.id.equalsExp(
              database.transactionTable.categoryId,
            ),
          ),
        ])
        ..where(database.transactionTable.id.equals(id));

      final result = await query.getSingleOrNull();
      if (result == null) {
        throw Exception('Transaction not found locally');
      }

      final category = result.readTable(database.categoryTable);
      final transaction = result.readTable(database.transactionTable);
      final account = result.readTable(database.accountTable);

      return TransactionResponseModel(
        id: transaction.id,
        account: AccountBriefModel(
          id: account.id,
          name: account.name,
          balance: account.balance,
          currency: account.currency,
        ),
        category: CategoryModel(
          id: category.id,
          name: category.name,
          emoji: category.emoji,
          isIncome: category.isIncome,
        ),
        createdAt: transaction.createdAt,
        updatedAt: transaction.updatedAt,
        amount: transaction.amount,
        transactionDate: transaction.transactionDate,
        comment: transaction.comment,
      );
    }
  }

  @override
  Future<List<TransactionResponseModel>> getTransactionsByPeriod({
    required int accountId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final hasConnection = await connectivity.hasConnection();

    //! GET EVENT DATA
    final createEvents = await database
        .select(database.createTransactionEventTable)
        .get();
    final updateEvents = await database
        .select(database.updateTransactionEventTable)
        .get();
    final deleteEvents = await database
        .select(database.deleteTransactionEventTable)
        .get();

    if (hasConnection) {
      //! TRY PUSH EVENT DATA'S TO SERVER && delete
      await _syncEventsWithServer(
        createEvents: createEvents,
        updateEvents: updateEvents,
        deleteEvents: deleteEvents,
      );

      //! TRY TO GET DATA FROM SERVER
      final transactions = await remoteDatasource
          .getTransactionsByPeriod(
            accountId: accountId,
            startDate: startDate,
            endDate: endDate,
          );

      //! TRY UPDATE LOCAL DATA
      // Заменяем локальные данные актуальными данными с сервера
      await _updateLocalTransactions(transactions);

      //! RETURN SERVER DATA
      return transactions;
    } else {
      //! GET LOCAL DATA'S
      // Если нет подключения, получаем локальные данные
      final localTransactions =
          await (database.select(
                database.transactionTable,
              )..where(
                (tbl) =>
                    tbl.accountId.equals(accountId) &
                    tbl.transactionDate.isBetweenValues(
                      startDate,
                      endDate,
                    ),
              ))
              .get();

      //! MERGE EVENT DATA ON LOCAL DATA'S
      // Применяем события как проекцию к локальным данным
      final mergedTransactionsDbModel = _applyEventsToLocalData(
        localTransactions,
        createEvents: createEvents,
        updateEvents: updateEvents,
        deleteEvents: deleteEvents,
      );

      //! RETURN MERGED DATA
      final List<TransactionResponseModel> mergedTransactions = [];

      for (int i = 0; i < mergedTransactionsDbModel.length; i++) {
        final transactionDbModel = mergedTransactionsDbModel[i];
        final id = transactionDbModel.id;

        final accounts = await database
            .select(database.accountTable)
            .get();

        print(accounts);

        // Получаем связанный аккаунт из AccountTable
        final account =
            await (database.select(database.accountTable)..where(
                  (tbl) =>
                      tbl.id.equals(transactionDbModel.accountId),
                ))
                .getSingleOrNull();

        if (account == null) {
          throw Exception(
            'Account not found for transaction with ID $id',
          );
        }

        // Получаем связанную категорию из CategoryTable
        final category =
            await (database.select(database.categoryTable)..where(
                  (tbl) =>
                      tbl.id.equals(transactionDbModel.categoryId),
                ))
                .getSingleOrNull();

        if (category == null) {
          throw Exception(
            'Category not found for transaction with ID $id',
          );
        }

        final mergedTransaction = TransactionResponseModel(
          id: transactionDbModel.id,
          account: AccountBriefModel(
            id: transactionDbModel.accountId,
            name: account.name,
            balance: account.balance,
            currency: account.currency,
          ),
          category: CategoryModel(
            id: transactionDbModel.categoryId,
            name: category.name,
            emoji: category.emoji,
            isIncome: category.isIncome,
          ),
          amount: transactionDbModel.amount,
          transactionDate: transactionDbModel.transactionDate,
          comment: transactionDbModel.comment,
          createdAt: transactionDbModel.createdAt,
          updatedAt: transactionDbModel.updatedAt,
        );

        mergedTransactions.add(mergedTransaction);
      }

      return mergedTransactions;
    }
  }

  @override
  Future<TransactionResponseModel?> updateTransaction({
    required int id,
    required TransactionRequestModel updatedModel,
  }) async {
    final hasConnection = await connectivity.hasConnection();

    if (hasConnection) {
      // Если есть подключение, обновляем транзакцию через datasource
      return remoteDatasource.updateTransaction(
        id: id,
        updatedModel: updatedModel,
      );
    } else {
      // Если нет подключения, сохраняем событие обновления в локальную базу
      final event = UpdateTransactionEventTableCompanion(
        id: Value(id),
        accountId: Value(updatedModel.accountId),
        categoryId: Value(updatedModel.categoryId),
        amount: Value(updatedModel.amount),
        transactionDate: Value(updatedModel.transactionDate),
        comment: Value(updatedModel.comment),
      );

      await TransactionEventDatasource(
        database: database,
      ).addUpdateTransactionEvent(event);
      return null; // Возвращаем null, так как транзакция не обновлена на сервере
    }
  }

  /// Синхронизирует локальные события с сервером
  Future<void> _syncEventsWithServer({
    required List<CreateTransactionEventDbModel> createEvents,
    required List<UpdateTransactionEventDbModel> updateEvents,
    required List<DeleteTransactionEventDbModel> deleteEvents,
  }) async {
    for (final event in createEvents) {
      final request = TransactionRequestModel(
        accountId: event.accountId,
        categoryId: event.categoryId,
        amount: event.amount,
        transactionDate: event.transactionDate,
        comment: event.comment,
      );

      await remoteDatasource.createTransaction(request);

      await TransactionEventDatasource(
        database: database,
      ).removeCreateTransactionEvent(event);
    }

    for (final event in updateEvents) {
      final request = TransactionRequestModel(
        accountId: event.accountId,
        categoryId: event.categoryId,
        amount: event.amount,
        transactionDate: event.transactionDate,
        comment: event.comment,
      );

      await remoteDatasource.updateTransaction(
        id: event.id,
        updatedModel: request,
      );

      await TransactionEventDatasource(
        database: database,
      ).removeUpdateTransactionEvent(event);
    }

    for (final event in deleteEvents) {
      await remoteDatasource.deleteTransaction(
        id: event.id,
      );

      await TransactionEventDatasource(
        database: database,
      ).removeDeleteTransactionEvent(event);
    }
  }

  Future<void> _updateLocalTransactions(
    List<TransactionResponseModel> serverTransactions,
  ) async {
    // Удаляем все локальные транзакции
    await database.delete(database.transactionTable).go();

    // Вставляем актуальные данные с сервера
    await database.batch((batch) {
      for (final transaction in serverTransactions) {
        batch.insert(
          database.transactionTable,
          TransactionTableCompanion(
            id: Value(transaction.id),
            accountId: Value(transaction.account.id),
            categoryId: Value(transaction.category.id),
            amount: Value(transaction.amount),
            transactionDate: Value(transaction.transactionDate),
            comment: Value(transaction.comment),
            createdAt: Value(transaction.createdAt),
            updatedAt: Value(transaction.updatedAt),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  List<TransactionDbModel> _applyEventsToLocalData(
    List<TransactionDbModel> localTransactions, {
    required List<CreateTransactionEventDbModel> createEvents,
    required List<UpdateTransactionEventDbModel> updateEvents,
    required List<DeleteTransactionEventDbModel> deleteEvents,
  }) {
    // Применяем события создания
    for (final event in createEvents) {
      localTransactions.add(
        TransactionDbModel(
          id: event.id,
          accountId: event.accountId,
          categoryId: event.categoryId,
          amount: event.amount,
          transactionDate: event.transactionDate,
          updatedAt: event.updatedAt,
          createdAt: event.createdAt,
          comment: event.comment,
        ),
      );
    }

    // Применяем события обновления
    for (final event in updateEvents) {
      final transactionIndex = localTransactions.indexWhere(
        (t) => t.id == event.id,
      );
      if (transactionIndex != -1) {
        localTransactions[transactionIndex] =
            localTransactions[transactionIndex].copyWith(
              accountId: event.accountId,
              categoryId: event.categoryId,
              amount: event.amount,
              transactionDate: event.transactionDate,
              comment: Value(event.comment),
            );
      }
    }

    // Применяем события удаления
    for (final event in deleteEvents) {
      localTransactions.removeWhere((t) => t.id == event.id);
    }

    return localTransactions;
  }
}
