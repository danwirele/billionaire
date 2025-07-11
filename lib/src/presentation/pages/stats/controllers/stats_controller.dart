import 'package:billionaire/src/domain/controllers/categories_repository.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:fuzzy/fuzzy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'stats_controller.g.dart';

@Riverpod(dependencies: [CategoriesRepository])
class StatsController extends _$StatsController {
  @override
  Future<List<CategoryModel>> build() async {
    return ref.read(categoriesRepositoryProvider.future);
  }

  Future<void> fuzzySearchLevenshtein(
    String query,
  ) async {
    final categories = state.value;
    if (categories == null) return;
    if (query.isEmpty) {
      state = AsyncData(
        await ref.read(categoriesRepositoryProvider.future),
      );
      return;
    }
    debugPrint(categories.toString());
    // Преобразование объектов CategoryModel в массив строк
    final names = categories.map((e) => e.name).toSet().toList();

    // Выполнение поиска
    final fuzy = Fuzzy(names);
    final results = fuzy.search(query);

    // Преобразование результатов обратно в объекты CategoryModel
    final categoryResults = <CategoryModel>[];
    for (final result in results) {
      final index = names.indexOf(result.item);
      categoryResults.add(categories[index]);
    }

    state = AsyncData(categoryResults);
  }
}
