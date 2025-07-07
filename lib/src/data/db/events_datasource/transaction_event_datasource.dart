import 'package:billionaire/src/data/db/db.dart';
import 'package:drift/drift.dart';

class TransactionEventDatasource {
  TransactionEventDatasource({required Database database})
    : _database = database;

  final Database _database;

  //CREATE

  Future<void> addCreateTransactionEvent(
    CreateTransactionEventTableCompanion event,
  ) async {
    await _database.createTransactionEventTable.insertOne(
      event,
      mode: InsertMode.insertOrFail,
    );
  }

  Future<bool> removeCreateTransactionEvent(
    CreateTransactionEventDbModel event,
  ) async {
    return _database.createTransactionEventTable.deleteOne(event);
  }

  //UPDATE

  Future<void> addUpdateTransactionEvent(
    UpdateTransactionEventTableCompanion event,
  ) async {
    await _database.updateTransactionEventTable.insertOne(
      event,
      mode: InsertMode.insertOrFail,
    );
  }

  Future<bool> removeUpdateTransactionEvent(
    UpdateTransactionEventDbModel event,
  ) async {
    return _database.updateTransactionEventTable.deleteOne(event);
  }

  //DELETE

  Future<void> addDeleteTransactionEvent(
    DeleteTransactionEventTableCompanion event,
  ) async {
    await _database.deleteTransactionEventTable.insertOne(
      event,
      mode: InsertMode.insertOrFail,
    );
  }

  Future<bool> removeDeleteTransactionEvent(
    DeleteTransactionEventDbModel event,
  ) async {
    return _database.deleteTransactionEventTable.deleteOne(event);
  }
}
