import 'package:billionaire/src/data/db/db.dart';
import 'package:drift/drift.dart';

class CategoriesLocalDatasource {
  CategoriesLocalDatasource({required Database database}) : _database = database;
  final Database _database;

  Future<void> saveCategories({
    required List<CategoryTableCompanion> categoryDbList,
  }) async {
    await _database.categoryTable.insertAll(categoryDbList);
  }

  Future<List<CategoryDbModel>> getAllCatgories() async {
    return _database.select(_database.categoryTable).get();
  }
}
