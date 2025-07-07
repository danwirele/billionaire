import 'package:drift/drift.dart';
part './models/category_table.dart';
part './models/transaction_table.dart';
part './models/account_table.dart';
part './events/create_transaction_event.dart';
part './events/update_transaction_event.dart';
part './events/delete_transaction_event.dart';

part 'db.g.dart';

@DriftDatabase(
  tables: [
    CategoryTable,
    TransactionTable,
    AccountTable,
    CreateTransactionEventTable,
    UpdateTransactionEventTable,
    DeleteTransactionEventTable,
  ],
)
class Database extends _$Database {
  Database(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
    );
  }

  /// Returns an auto-updating stream of all todo entries in a given category
  /// id.
  Stream<List<CategoryDbModel>> entriesInCategory() => select(categoryTable).watch();
}
