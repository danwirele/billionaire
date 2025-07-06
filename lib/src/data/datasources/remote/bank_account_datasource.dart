import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/domain/models/account/account_response_model.dart';
import 'package:billionaire/src/domain/models/account/account_update_request_model.dart';
import 'package:dio/dio.dart';

abstract interface class AccountRemoteDatasource {
  Future<AccountModel?> getAllAccounts();

  Future<AccountResponseModel?> getBankAccountById(int id);

  Future<AccountModel?> updateBankAccount({
    required int id,
    required AccountUpdateRequestModel updatedModel,
  });
}

class AccountRemoteDatasourceImpl implements AccountRemoteDatasource {
  const AccountRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<AccountModel?> getAllAccounts() async {
    final response = await _dio.get(
      '/accounts',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ',
        },
      ),
    );

    final json = response.data as Map<String, dynamic>;

    return AccountModel.fromJson(json);
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
