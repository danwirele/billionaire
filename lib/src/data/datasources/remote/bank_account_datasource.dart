import 'package:billionaire/core/config/config.dart';
import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/domain/models/account/account_response_model.dart';
import 'package:billionaire/src/domain/models/account/account_update_request_model.dart';
import 'package:dio/dio.dart';

abstract interface class BankAccountRemoteDatasource {
  Future<List<AccountModel>> getAllAccounts();

  Future<AccountResponseModel?> getBankAccountById(int id);

  Future<AccountModel?> updateBankAccount({
    required int id,
    required AccountUpdateRequestModel updatedModel,
  });
}

class BankAccountRemoteDatasourceImpl
    implements BankAccountRemoteDatasource {
  const BankAccountRemoteDatasourceImpl({required Dio dio})
    : _dio = dio;

  final Dio _dio;

  @override
  Future<List<AccountModel>> getAllAccounts() async {
    final response = await _dio.get(
      '${Config.baseUrl}/accounts',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Config.apiKey}',
        },
        extra: {'dtoType': AccountModel},
      ),
    );

    final jsonList = (response.data as List<dynamic>)
        .map((e) => e as AccountModel)
        .toList();

    return jsonList;
  }

  @override
  Future<AccountResponseModel?> getBankAccountById(int id) async {
    final response = await _dio.get('/accounts/$id');

    final json = response.data as Map<String, dynamic>;

    return AccountResponseModel.fromJson(json);
  }

  @override
  Future<AccountModel?> updateBankAccount({
    required int id,
    required AccountUpdateRequestModel updatedModel,
  }) async {
    final response = await _dio.get('/accounts/$id');

    final json = response.data as Map<String, dynamic>;

    return AccountModel.fromJson(json);
  }
}
