import 'package:billionaire/src/data/db/db.dart';
import 'package:billionaire/src/data/repositories/impl/category_repository_impl.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/domain/repositories/category_repository.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'mocks.dart';
import 'mocks_when_helper.dart';

const List<CategoryModel> categoriesList = [
  CategoryModel(
    id: 1,
    name: 'firstCategort',
    emoji: '',
    isIncome: true,
  ),
  CategoryModel(
    id: 2,
    name: 'secondCategory',
    emoji: '',
    isIncome: false,
  ),
  CategoryModel(
    id: 3,
    name: 'thirdCategory',
    emoji: '',
    isIncome: true,
  ),
];

// AAA ARANGE ACT ASSERT
void main() {
  late CategoryRepository categoriesRepository;
  late Database database;
  late CategoriesDatasourceMock remoteDatasource;
  late CategoriesLocalDatasourceMock localDatasource;
  late ConnectivityMock connectivityMock;

  setUpAll(
    () async {
      database = Database(
        DatabaseConnection(
          NativeDatabase.memory(),
          closeStreamsSynchronously: true,
        ),
      );

      connectivityMock = ConnectivityMock();

      await mockCheckConnectivitySuccess(connectivityMock);

      remoteDatasource = CategoriesDatasourceMock();

      await mockGetAllCategoriesRemoteSuccess(remoteDatasource);
      await mockGetAllCategoriesByTypeRemoteSuccess(
        remoteDatasource,
        isIncome: true,
      );
      await mockGetAllCategoriesByTypeRemoteSuccess(
        remoteDatasource,
        isIncome: false,
      );

      localDatasource = CategoriesLocalDatasourceMock();

      await mockSaveAllCategoriesLocalSuccess(localDatasource);
      await mockGetAllCategoriesLocalSuccess(localDatasource);

      categoriesRepository = CategoryRepositoryImpl(
        remoteDatasource: remoteDatasource,
        localDatasource: localDatasource,
        database: database,
        connectivity: connectivityMock,
      );
    },
  );

  tearDownAll(
    () async {
      await database.close();
    },
  );
  group(
    'Categories Repository',
    () {
      test(
        'Получения списка всех категорий',
        () async {
          final categories = await categoriesRepository
              .getAllCategories();

          expect(categories, isA<List<CategoryModel>>());
          expect(categories, hasLength(categoriesList.length));
          expect(categories, equals(categoriesList));
        },
      );

      test(
        'Получение списка категорий по типу, Expenses',
        () async {
          final categories = await categoriesRepository
              .getAllCategoriesByType(isIncome: false);

          expect(categories, isA<List<CategoryModel>>());

          expect(
            categories.every(
              (category) => category.isIncome == false,
            ),
            isTrue,
          );
        },
      );

      test(
        'Получение списка категорий по типу, Income',
        () async {
          final categories = await categoriesRepository
              .getAllCategoriesByType(isIncome: true);

          expect(categories, isA<List<CategoryModel>>());

          expect(
            categories.every((category) => category.isIncome == true),
            isTrue,
          );
        },
      );
    },
  );
}
