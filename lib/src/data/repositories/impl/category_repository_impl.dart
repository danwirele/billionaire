import 'package:billionaire/core/utils/conecction_extension.dart';
import 'package:billionaire/src/data/datasources/local/categories_local_datasource.dart';
import 'package:billionaire/src/data/datasources/remote/categories_datasource.dart';
import 'package:billionaire/src/data/db/db.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/domain/repositories/category_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.database,
  });

  static final Connectivity connectivity = Connectivity();

  final CategoriesLocalDatasource localDatasource;
  final Database database;
  final CategoriesDatasource remoteDatasource;

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final hasConnection = await connectivity.hasConnection();

    if (hasConnection) {
      // Если есть подключение, создаем транзакцию через datasource
      final categories = await remoteDatasource.getAllCategories();

      // Если нет подключения, сохраняем событие в локальную базу
      final categoryDbList = categories
          .map(
            (e) => CategoryTableCompanion(
              id: Value(e.id),
              name: Value(e.name),
              emoji: Value(e.emoji),
              isIncome: Value(e.isIncome),
            ),
          )
          .toList();

      localDatasource.saveCategories(
        categoryDbList: categoryDbList,
      );

      return categories;
    } else {
      return (await localDatasource.getAllCatgories())
          .map(
            (e) => CategoryModel.fromJson(e.toJson()),
          )
          .toList();
    }
  }

  @override
  Future<List<CategoryModel>> getAllCategoriesByType({required bool isIncome}) async {
    final hasConnection = await connectivity.hasConnection();
    if (hasConnection) {
      return remoteDatasource.getAllCategoriesByType(isIncome: isIncome);
    } else {
      return (await localDatasource.getAllCatgories())
          .where(
            (element) => element.isIncome == isIncome,
          )
          .map(
            (e) => CategoryModel.fromJson(e.toJson()),
          )
          .toList();
    }
  }
}
