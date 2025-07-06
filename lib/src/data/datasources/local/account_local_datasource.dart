import 'package:billionaire/src/data/db/db.dart';
import 'package:drift/drift.dart';

abstract interface class AccountLocalDatasource {
  Future<void> saveAccount({
    required AccountTableCompanion accountDbModel,
  });

  Future<AccountDbModel?> getAccount();

  Future<bool> updateAccount({
    required AccountTableCompanion updatedModel,
  });
}

class AccountLocalDatasourceImpl implements AccountLocalDatasource {
  const AccountLocalDatasourceImpl({required Database database})
    : _database = database;
  final Database _database;

  @override
  Future<void> saveAccount({
    required AccountTableCompanion accountDbModel,
  }) async {
    await _database.accountTable.insertOne(accountDbModel);
  }

  @override
  Future<AccountDbModel?> getAccount() async {
    return _database.select(_database.accountTable).getSingleOrNull();
  }

  @override
  Future<bool> updateAccount({
    required AccountTableCompanion updatedModel,
  }) async {
    final result = await _database
        .update(_database.accountTable)
        .write(updatedModel);
    return result > 0;
  }
}
