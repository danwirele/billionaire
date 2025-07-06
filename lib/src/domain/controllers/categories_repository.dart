import 'package:billionaire/src/data/db/db_service.dart';
import 'package:billionaire/src/data/repositories/mock/mock_category_repository_impl.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/domain/repositories/category_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_repository.g.dart';

@Riverpod(keepAlive: true)
class CategoriesRepository extends _$CategoriesRepository {
  late final CategoryRepository categoryRepo;
  @override
  Future<List<CategoryModel>> build() async {
    final database = await ref.read(dbServiceProvider.future);
    categoryRepo = MockCategoryRepositoryImpl(database: database);
    return categoryRepo.getAllCategories();
  }
}
