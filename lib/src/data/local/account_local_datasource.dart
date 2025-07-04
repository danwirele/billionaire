import 'package:billionaire/src/data/db/db.dart';
import 'package:drift/drift.dart';

class AccountLocalDatasource {
  AccountLocalDatasource({required Database database}) : _database = database;
  final Database _database;

  Future<void> saveAccount({
    required AccountTableCompanion accountDbModel,
  }) async {
    await _database.accountTable.insertOne(accountDbModel);
  }

  Future<AccountDbModel?> getAccount() async {
    return _database.select(_database.accountTable).getSingleOrNull();
  }

  Future<bool> updateAccount({
    required AccountTableCompanion updatedModel,
  }) async {
    final result = await _database.update(_database.accountTable).write(updatedModel);
    return result > 0;
  }
}
