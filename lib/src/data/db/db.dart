import 'package:drift/drift.dart';

part './models/category_table.dart';
part 'db.g.dart';

@DriftDatabase(tables: [CategoryTable])
class Database extends _$Database {
  Database(super.e);

  @override
  int get schemaVersion => 2;

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
