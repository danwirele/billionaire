import 'package:billionaire/main.dart';
import 'package:billionaire/src/data/db/db.dart';
import 'package:drift/drift.dart';

class AccountLocalDatasource {
  Future<void> saveAccount({required AccountDbModel accountDbModel}) async {
    await database.accountTable.insertOne(accountDbModel);
  }

  Future<AccountDbModel> getAccount() async {
    return database.select(database.accountTable).getSingle();
  }

  Future<bool> updateAccount({required AccountDbModel updatedModel}) async {
    final result = await database.update(database.accountTable).write(updatedModel);
    return result > 0;
  }
}
