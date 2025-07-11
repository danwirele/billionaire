import 'package:billionaire/core/config/config.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:dio/dio.dart';

abstract interface class CategoriesDatasource {
  Future<List<CategoryModel>> getAllCategories();

  Future<List<CategoryModel>> getAllCategoriesByType({
    required bool isIncome,
  });
}

class CategoriesDatasourceImpl implements CategoriesDatasource {
  const CategoriesDatasourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final response = await _dio.get(
      '${Config.baseUrl}/categories',
      options: Options(extra: {'dtoType': CategoryModel}),
    );

    final jsonList = (response.data as List<dynamic>).map((e) => e as CategoryModel).toList();

    return jsonList;
  }

  @override
  Future<List<CategoryModel>> getAllCategoriesByType({
    required bool isIncome,
  }) async {
    final response = await _dio.get(
      '${Config.baseUrl}/categories/type/$isIncome',
      options: Options(extra: {'dtoType': CategoryModel}),
    );

    final jsonList = (response.data as List<dynamic>).map((e) => e as CategoryModel).toList();

    return jsonList;
  }
}
