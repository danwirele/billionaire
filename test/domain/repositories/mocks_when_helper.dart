import 'package:billionaire/src/data/db/db.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

const List<CategoryModel> testCategories = [
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

Future<void> mockGetAllCategoriesRemoteSuccess(
  CategoriesDatasourceMock mock,
) async => when(
  () => mock.getAllCategories(),
).thenAnswer((_) async => testCategories);

Future<void> mockGetAllCategoriesByTypeRemoteSuccess(
  CategoriesDatasourceMock mock, {
  required bool isIncome,
}) async =>
    when(
      () => mock.getAllCategoriesByType(isIncome: isIncome),
    ).thenAnswer(
      (_) async => testCategories
          .where(
            (element) => element.isIncome == isIncome,
          )
          .toList(),
    );

Future<void> mockGetAllCategoriesLocalSuccess(
  CategoriesLocalDatasourceMock mock,
) async => when(() => mock.getAllCatgories()).thenAnswer(
  (_) async => testCategories
      .map((e) => CategoryDbModel.fromJson(e.toJson()))
      .toList(),
);
Future<void> mockSaveAllCategoriesLocalSuccess(
  CategoriesLocalDatasourceMock mock,
) async => when(
  () => mock.saveCategories(
    categoryDbList: any(named: 'categoryDbList'),
  ),
).thenAnswer((_) async {});

Future<void> mockCheckConnectivitySuccess(Connectivity mock) async {
  when(
    () => mock.checkConnectivity(),
  ).thenAnswer((_) async => [ConnectivityResult.mobile]);
}
