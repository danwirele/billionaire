import 'package:billionaire/src/data/datasources/local/categories_local_datasource.dart';
import 'package:billionaire/src/data/db/db.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/domain/repositories/category_repository.dart';
import 'package:drift/drift.dart';

class MockCategoryRepositoryImpl implements CategoryRepository {
  MockCategoryRepositoryImpl({required Database database})
    : _database = database {
    _categoriesLocalDatasource = CategoriesLocalDatasourceImpl(
      database: _database,
    );
    resetMockData();
  }
  final Database _database;
  late final CategoriesLocalDatasource _categoriesLocalDatasource;

  final List<CategoryModel> _mockCategories = [];

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final categories = await _categoriesLocalDatasource
        .getAllCatgories();

    if (categories.isEmpty) {
      final categoryDbList = _mockCategories
          .map(
            (e) => CategoryTableCompanion(
              apiId: Value(e.id),
              name: Value(e.name),
              emoji: Value(e.emoji),
              isIncome: Value(e.isIncome),
            ),
          )
          .toList();

      await _categoriesLocalDatasource.saveCategories(
        categoryDbList: categoryDbList,
      );

      return categoryDbList
          .map(
            (category) => CategoryModel(
              id: category.apiId.value,
              name: category.name.value,
              emoji: category.emoji.value,
              isIncome: category.isIncome.value,
            ),
          )
          .toList();
    }

    return categories
        .map(
          (category) => CategoryModel(
            id: category.apiId,
            name: category.name,
            emoji: category.emoji,
            isIncome: category.isIncome,
          ),
        )
        .toList();
  }

  @override
  Future<List<CategoryModel>> getAllCategoriesByType({
    required bool isIncome,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    return _mockCategories
        .where((category) => category.isIncome == isIncome)
        .toList();
  }

  /// [resetMockData] Вспомогательный метод для тестов
  /// сброс данных в исходное состояние
  void resetMockData() {
    _mockCategories.clear();
    _mockCategories.addAll([
      CategoryModel.fromJson({
        'id': 1,
        'name': 'Зарплата',
        'emoji': '💰',
        'isIncome': true,
      }),
      CategoryModel.fromJson({
        'id': 2,
        'name': 'Фриланс',
        'emoji': '💻',
        'isIncome': true,
      }),
      CategoryModel.fromJson({
        'id': 3,
        'name': 'Дивиденды',
        'emoji': '📈',
        'isIncome': true,
      }),
      CategoryModel.fromJson({
        'id': 4,
        'name': 'Продукты',
        'emoji': '🍎',
        'isIncome': false,
      }),
      CategoryModel.fromJson({
        'id': 5,
        'name': 'Транспорт',
        'emoji': '🚕',
        'isIncome': false,
      }),
      CategoryModel.fromJson({
        'id': 6,
        'name': 'Развлечения',
        'emoji': '🎮',
        'isIncome': false,
      }),
      CategoryModel.fromJson({
        'id': 7,
        'name': 'Подарки',
        'emoji': '🎁',
        'isIncome': true,
      }),
      CategoryModel.fromJson({
        'id': 8,
        'name': 'Образование',
        'emoji': '🎓',
        'isIncome': false,
      }),
    ]);
  }
}
