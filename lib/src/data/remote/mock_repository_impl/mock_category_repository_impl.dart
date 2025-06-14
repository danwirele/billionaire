import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/domain/repositories/category_repository.dart';

class MockCategoryRepositoryImpl
    implements CategoryRepository {
  MockCategoryRepositoryImpl() {
    resetMockData();
  }

  final List<CategoryModel> _mockCategories = [];

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    await Future.delayed(const Duration(milliseconds: 250));
    return _mockCategories;
  }

  @override
  Future<List<CategoryModel>> getAllCategoriesByType({
    required bool isIncome,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));

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
        "id": 1,
        "name": "Зарплата",
        "emoji": "💰",
        "isIncome": true,
      }),
      CategoryModel.fromJson({
        "id": 2,
        "name": "Фриланс",
        "emoji": "💻",
        "isIncome": true,
      }),
      CategoryModel.fromJson({
        "id": 3,
        "name": "Дивиденды",
        "emoji": "📈",
        "isIncome": true,
      }),
      CategoryModel.fromJson({
        "id": 4,
        "name": "Продукты",
        "emoji": "🍎",
        "isIncome": false,
      }),
      CategoryModel.fromJson({
        "id": 5,
        "name": "Транспорт",
        "emoji": "🚕",
        "isIncome": false,
      }),
      CategoryModel.fromJson({
        "id": 6,
        "name": "Развлечения",
        "emoji": "🎮",
        "isIncome": false,
      }),
      CategoryModel.fromJson({
        "id": 7,
        "name": "Подарки",
        "emoji": "🎁",
        "isIncome": true,
      }),
      CategoryModel.fromJson({
        "id": 8,
        "name": "Образование",
        "emoji": "🎓",
        "isIncome": false,
      }),
    ]);
  }
}
