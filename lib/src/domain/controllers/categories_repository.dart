import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/domain/repo_impl_provider/category_repository_impl_di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_repository.g.dart';

@Riverpod()
class CategoriesRepository extends _$CategoriesRepository {
  @override
  Future<List<CategoryModel>> build() async {
    final categoryRepo = await ref.read(
      categoryRepositoryImplDiProvider.future,
    );
    return categoryRepo.getAllCategories();
  }
}
