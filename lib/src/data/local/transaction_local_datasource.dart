import 'package:billionaire/src/data/db/db.dart';
import 'package:drift/drift.dart';

class TransactionLocalDatasource {
  TransactionLocalDatasource({required Database database}) : _database = database;
  final Database _database;

  Future<void> saveTransaction({required TransactionDbModel transaction}) async {
    await _database.transactionTable.insertOne(
      transaction,
      mode: InsertMode.insertOrFail,
    );
  }

  Future<List<TransactionDbModel>> getAllTransactions() async {
    return _database.select(_database.transactionTable).get();
  }

  Future<List<TransactionDbModel>> getTransactionsByType({required bool isIncome}) async {
    final categories = _database.categoryTable;
    final transactions = _database.transactionTable;

    final result = await (transactions.select().join([
      innerJoin(
        categories,
        categories.id.equalsExp(transactions.id),
      ),
    ])..where(categories.isIncome.isValue(isIncome))).get();

    return result.map<TransactionDbModel>(
      (e) {
        final data = e.rawData;
        return TransactionDbModel(
          id: data.read('id'),
          accountId: data.read('accountId'),
          categoryId: data.read('categoryId'),
          amount: data.read('amount'),
          transactionDate: data.read('transactionDate'),
        );
      },
    ).toList();
  }
}
