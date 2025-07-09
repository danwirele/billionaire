import 'package:billionaire/src/data/db/db.dart';
import 'package:drift/drift.dart';

abstract interface class BankAccountLocalDatasource {
  Future<void> saveAccount({
    required AccountTableCompanion accountDbModel,
  });

  Future<List<AccountDbModel>> getAllAccounts();

  Future<AccountDbModel?> getAccountById(int id);

  Future<bool> updateAccount({
    required AccountTableCompanion updatedModel,
  });

  Future<void> saveAllAccounts({
    required List<AccountTableCompanion> accountList,
  });
}

class BankAccountLocalDatasourceImpl
    implements BankAccountLocalDatasource {
  const BankAccountLocalDatasourceImpl({
    required Database database,
  }) : _database = database;
  final Database _database;

  @override
  Future<void> saveAccount({
    required AccountTableCompanion accountDbModel,
  }) async {
    await _database.accountTable.insertOne(
      accountDbModel,
      mode: InsertMode.insertOrFail,
    );
  }

  @override
  Future<List<AccountDbModel>> getAllAccounts() async {
    return _database.select(_database.accountTable).get();
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

  @override
  Future<void> saveAllAccounts({
    required List<AccountTableCompanion> accountList,
  }) async {
    await _database.accountTable.insertAll(
      accountList,
      mode: InsertMode.insertOrReplace,
    );
  }

  @override
  Future<AccountDbModel?> getAccountById(int id) {
    throw UnimplementedError();
  }
}
