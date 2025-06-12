import 'package:billionaire/src/domain/models/category/category_model.dart';

/// [CategoryRepository] - репозиторий для работы с [CategoryModel]
abstract interface class CategoryRepository {
  /// [getAllCategoriesByType] метод для получения списка всех категорий
  Future<List<CategoryModel>> getAllCategories();

  /// [getAllCategoriesByType] метод для получения списка всех категория по типу
  /// [isIncome] - тип категорий: true - доходы; false - расходы.
  Future<List<CategoryModel>> getAllCategoriesByType({
    required bool isIncome,
  });
}
