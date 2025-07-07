import 'package:billionaire/src/data/datasources/remote/transaction_datasource.dart';
import 'package:billionaire/src/data/db/db.dart';
import 'package:billionaire/src/data/db/events_datasource/transaction_event_datasource.dart';
import 'package:billionaire/src/domain/models/account/account_brief_model.dart';
import 'package:billionaire/src/domain/models/transactions/transaction.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_request.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/domain/repositories/transaction_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl({
    required this.datasource,
    required this.database,
  });

  static final Connectivity connectivity = Connectivity();

  final TransactionDatasource datasource;
  final Database database;

  @override
  Future<TransactionModel?> createTransaction(
    TransactionRequestModel model,
  ) async {
    final hasConnection = await _hasConnection();

    if (hasConnection) {
      // Если есть подключение, создаем транзакцию через datasource
      return datasource.createTransaction(model);
    } else {
      // Если нет подключения, сохраняем событие в локальную базу
      final event = CreateTransactionEventTableCompanion(
        accountId: Value(model.accountId),
        categoryId: Value(model.categoryId),
        amount: Value(model.amount),
        transactionDate: Value(model.transactionDate),
        comment: Value(model.comment),
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
    final hasConnection = await _hasConnection();

    if (hasConnection) {
      // Если есть подключение, удаляем транзакцию через datasource
      await datasource.deleteTransaction(
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
    final hasConnection = await _hasConnection();

    if (hasConnection) {
      // Если есть подключение, получаем транзакцию через datasource
      return datasource.getTransactionById(id);
    } else {
      // Если нет подключения, возвращаем локальные данные
      final localTransaction = await database
          .select(database.transactionTable)
          .where((tbl) => tbl.id.equals(id))
          .getSingleOrNull();

      if (localTransaction == null) {
        throw Exception('Transaction not found locally');
      }

      return TransactionResponseModel(
        id: localTransaction.id,
        account: AccountBriefModel(
          id: localTransaction.accountId,
          name: name,
          balance: balance,
          currency: currency,
        ),
        category: CategoryDbModel(
          id: localTransaction.categoryId,
          name: name,
          emoji: emoji,
          isIncome: isIncome,
        ),
        amount: localTransaction.amount,
        transactionDate: localTransaction.transactionDate,
        comment: localTransaction.comment,
      );
    }
  }

  @override
  Future<List<TransactionResponseModel>> getTransactionsByPeriod({
    required int accountId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final hasConnection = await _hasConnection();

    //TODO GET EVENT DATA
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
      //TRY PUSH EVENT DATA'S TO SERVER && delete
      await _syncEventsWithServer(
        createEvents: createEvents,
        updateEvents: updateEvents,
        deleteEvents: deleteEvents,
      );

      //TRY TO GET DATA FROM SERVER
      final transactions = await datasource.getTransactionsByPeriod(
        accountId: accountId,
        startDate: startDate,
        endDate: endDate,
      );

      //TODO TRY UPDATE LOCAL DATA

      //RETURN SERVER DATA
      return transactions;
    } else {
      //TODO GET LOCAL DATA'S

      //TODO MERGE EVENT DATA ON LOCAL DATA'S

      //TODO RETURN MERGED DATA
      return [];
    }
  }

  @override
  Future<TransactionResponseModel?> updateTransaction({
    required int id,
    required TransactionRequestModel updatedModel,
  }) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }

  Future<bool> _hasConnection() async {
    final connections = await connectivity.checkConnectivity();

    return !connections.contains(
      ConnectivityResult.none,
    );
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

      await datasource.createTransaction(request);

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

      await datasource.updateTransaction(
        id: event.id,
        updatedModel: request,
      );

      await TransactionEventDatasource(
        database: database,
      ).removeUpdateTransactionEvent(event);
    }

    for (final event in deleteEvents) {
      await datasource.deleteTransaction(
        id: event.id,
      );

      await TransactionEventDatasource(
        database: database,
      ).removeDeleteTransactionEvent(event);
    }
  }
}
