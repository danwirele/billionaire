import 'package:billionaire/src/domain/models/transactions/transaction.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_request.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:dio/dio.dart';

abstract interface class TransactionDatasource {
  Future<TransactionModel?> createTransaction(
    TransactionRequestModel model,
  );

  Future<TransactionResponseModel> getTransactionById(int id);

  Future<TransactionResponseModel?> updateTransaction({
    required int id,
    required TransactionRequestModel updatedModel,
  });

  Future<void> deleteTransaction({required int id});

  Future<List<TransactionResponseModel>> getTransactionsByPeriod({
    required int accountId,
    required DateTime startDate,
    required DateTime endDate,
  });
}

class TransactionDatasourceImpl implements TransactionDatasource {
  const TransactionDatasourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<TransactionModel?> createTransaction(
    TransactionRequestModel model,
  ) async {
    final response = await _dio.post(
      '/transactions',
      data: model.toJson(),
    );

    final jsonList = response.data as Map<String, dynamic>;

    return TransactionModel.fromJson(jsonList);
  }

  //TODO! THINK
  @override
  Future<void> deleteTransaction({required int id}) async {
    await _dio.delete('/transactions/$id');
  }

  @override
  Future<TransactionResponseModel> getTransactionById(int id) async {
    final response = await _dio.get('/transactions/$id');

    final jsonList = response.data as Map<String, dynamic>;

    return TransactionResponseModel.fromJson(jsonList);
  }

  @override
  Future<List<TransactionResponseModel>> getTransactionsByPeriod({
    required int accountId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final response = await _dio.get(
      '/transactions/account/$accountId/period',
      queryParameters: {
        'startDate': startDate,
        'endDate': endDate,
      },
    );

    final jsonList = response.data as List<Map<String, dynamic>>;

    return jsonList
        .map((e) => TransactionResponseModel.fromJson(e))
        .toList();
  }

  @override
  Future<TransactionResponseModel?> updateTransaction({
    required int id,
    required TransactionRequestModel updatedModel,
  }) async {
    final response = await _dio.put(
      '/transactions/$id',
      data: updatedModel.toJson(),
    );

    final jsonList = response.data as Map<String, dynamic>;

    return TransactionResponseModel.fromJson(jsonList);
  }
}
