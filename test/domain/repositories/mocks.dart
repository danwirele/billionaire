import 'package:billionaire/src/data/datasources/local/categories_local_datasource.dart';
import 'package:billionaire/src/data/datasources/remote/categories_datasource.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mocktail/mocktail.dart';

class CategoriesDatasourceMock extends Mock
    implements CategoriesDatasource {}

class CategoriesLocalDatasourceMock extends Mock
    implements CategoriesLocalDatasource {}

class ConnectivityMock extends Mock implements Connectivity {}
