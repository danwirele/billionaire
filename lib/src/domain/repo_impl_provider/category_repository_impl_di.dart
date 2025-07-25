import 'package:billionaire/src/data/datasources/local/categories_local_datasource.dart';
import 'package:billionaire/src/data/datasources/remote/categories_datasource.dart';
import 'package:billionaire/src/data/db/db_service.dart';
import 'package:billionaire/src/data/repositories/impl/category_repository_impl.dart';
import 'package:billionaire/src/data/services/dio_service.dart';
import 'package:billionaire/src/domain/repositories/category_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_repository_impl_di.g.dart';

@Riverpod(keepAlive: true)
class CategoryRepositoryImplDi extends _$CategoryRepositoryImplDi {
  @override
  FutureOr<CategoryRepository> build() async {
    final database = await ref.read(dbServiceProvider.future);

    final dio = ref.read(dioServiceProvider);

    return CategoryRepositoryImpl(
      database: database,
      remoteDatasource: CategoriesDatasourceImpl(dio: dio),
      localDatasource: CategoriesLocalDatasourceImpl(
        database: database,
      ),
      connectivity: Connectivity(),
    );
  }
}
