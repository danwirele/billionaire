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
    final response = await _dio.get('/categories');

    final jsonList = response.data as List<Map<String, dynamic>>;

    return jsonList.map((e) => CategoryModel.fromJson(e)).toList();
  }

  @override
  Future<List<CategoryModel>> getAllCategoriesByType({
    required bool isIncome,
  }) async {
    final response = await _dio.get('/categories/type/$isIncome');

    final jsonList = response.data as List<Map<String, dynamic>>;

    return jsonList.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
