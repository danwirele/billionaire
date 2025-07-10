import 'package:billionaire/core/config/config.dart';
import 'package:billionaire/src/domain/models/transactions/transaction.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_request.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
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
      '${Config.baseUrl}/transactions',
      data: {
        'accountId': model.accountId,
        'categoryId': model.categoryId,
        'amount': model.amount.replaceAll(' ', ''),
        'transactionDate': model.transactionDate
            .toUtc()
            .toIso8601String(),
        'comment': model.comment,
      },
      options: Options(extra: {'dtoType': TransactionModel}),
    );

    final jsonList = response.data as TransactionModel?;

    return jsonList;
  }

  //TODO! THINK
  @override
  Future<void> deleteTransaction({required int id}) async {
    await _dio.delete(
      '${Config.baseUrl}/transactions/$id',
      options: Options(extra: {'dtoType': TransactionModel}),
    );
  }

  @override
  Future<TransactionResponseModel> getTransactionById(int id) async {
    final response = await _dio.get(
      '${Config.baseUrl}/transactions/$id',
      options: Options(extra: {'dtoType': TransactionResponseModel}),
    );

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
      '${Config.baseUrl}/transactions/account/157/period',
      queryParameters: {
        'startDate': startDate.toYYYYMMdd(),
        'endDate': endDate.toYYYYMMdd(),
      },
      options: Options(extra: {'dtoType': TransactionResponseModel}),
    );

    final jsonList = (response.data as List<dynamic>)
        .map((e) => e as TransactionResponseModel)
        .toList();

    return jsonList;
  }

  //TODO FIX BUG WHEN CREATE LOCAL TRANSACTION THEN UPDATE IT
  @override
  Future<TransactionResponseModel?> updateTransaction({
    required int id,
    required TransactionRequestModel updatedModel,
  }) async {
    final response = await _dio.put(
      '${Config.baseUrl}/transactions/$id',
      data: {
        'accountId': updatedModel.accountId,
        'categoryId': updatedModel.categoryId,
        'amount': updatedModel.amount,
        'transactionDate': updatedModel.transactionDate
            .toUtc()
            .toIso8601String(),
        'comment': updatedModel.comment,
      },
      options: Options(extra: {'dtoType': TransactionResponseModel}),
    );

    final jsonList = response.data as TransactionResponseModel?;

    return jsonList;
  }
}
