import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/domain/models/account/account_response_model.dart';
import 'package:billionaire/src/domain/models/account/account_update_request_model.dart';

/// [BankAccountRepository] - репозиторий для работы с [AccountModel]
abstract interface class BankAccountRepository {
  /// [getAllBankAccounts] метод для получения списка всех счетов текущего пользователя
  Future<List<AccountModel>> getAllBankAccounts();

  /// [getBankAccountById] метод для получения информации о конкретном счете, включая статистику
  /// [id] - ID счета.
  Future<AccountResponseModel> getBankAccountById(int id);

  /// [updateBankAccount] метод для получения информации о конкретном счете, включая статистику
  /// [updatedModel] - обновленная модель счета;
  Future<AccountModel?> updateBankAccount({
    required int id,
    required AccountUpdateRequestModel updatedModel,
  });
}
