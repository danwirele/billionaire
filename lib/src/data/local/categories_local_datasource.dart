import 'package:billionaire/main.dart';
import 'package:billionaire/src/data/db/db.dart';
import 'package:drift/drift.dart';

class CategoriesLocalDatasource {
  Future<void> saveCategories({
    required List<CategoryTableCompanion> categoryDbList,
  }) async {
    await database.categoryTable.insertAll(categoryDbList);
  }

  Future<List<CategoryDbModel>> getAllCatgories() async {
    return database.select(database.categoryTable).get();
  }
}
