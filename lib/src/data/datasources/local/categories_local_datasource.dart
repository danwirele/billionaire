import 'package:billionaire/src/data/db/db.dart';
import 'package:drift/drift.dart';

abstract interface class CategoriesLocalDatasource {
  Future<void> saveCategories({
    required List<CategoryTableCompanion> categoryDbList,
  });

  Future<List<CategoryDbModel>> getAllCatgories();
}

class CategoriesLocalDatasourceImpl
    implements CategoriesLocalDatasource {
  const CategoriesLocalDatasourceImpl({required Database database})
    : _database = database;
  final Database _database;

  @override
  Future<void> saveCategories({
    required List<CategoryTableCompanion> categoryDbList,
  }) async {
    await _database.categoryTable.insertAll(categoryDbList);
  }

  @override
  Future<List<CategoryDbModel>> getAllCatgories() async {
    return _database.select(_database.categoryTable).get();
  }
}
