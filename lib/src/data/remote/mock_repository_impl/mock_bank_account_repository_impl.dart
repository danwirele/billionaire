import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/domain/models/account/account_response_model.dart';
import 'package:billionaire/src/domain/models/account/account_update_request_model.dart';
import 'package:billionaire/src/domain/repositories/bank_account_repository.dart';

class MockBankAccountRepositoryImpl implements BankAccountRepository {
  MockBankAccountRepositoryImpl() {
    resetMockData();
  }

  final List<AccountModel> _mockAccounts = [];
  final List<AccountResponseModel> _mockAccountResponses = [];

  @override
  Future<List<AccountModel>> getAllBankAccounts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockAccounts;
  }

  @override
  Future<AccountResponseModel> getBankAccountById(int id) async {
    await Future.delayed(const Duration(milliseconds: 200));

    return _mockAccountResponses.singleWhere(
      (account) => account.id == id,
      orElse: () => throw Exception("Счет с ID $id не найден"),
    );
  }

  @override
  Future<AccountModel?> updateBankAccount({
    required int id,
    required AccountUpdateRequestModel updatedModel,
  }) async {
    await Future.delayed(const Duration(milliseconds: 250));

    final index = _mockAccounts.indexWhere(
      (account) => account.id == id,
    );

    if (index == -1) return null;

    final oldModel = _mockAccounts[index];
    _mockAccounts[index] = oldModel.copyWith(
      name: updatedModel.name ?? oldModel.name,
      balance: updatedModel.balance ?? oldModel.balance,
      currency: updatedModel.currency ?? oldModel.currency,
    );

    return _mockAccounts[index];
  }

  /// [resetMockData] Вспомогательный метод для тестов
  /// сброс данных в исходное состояние
  void resetMockData() {
    _mockAccounts.clear();
    _mockAccountResponses.clear();
    _mockAccounts.addAll([
      AccountModel.fromJson({
        "id": 1,
        "userId": 1,
        "name": "Основной счёт",
        "balance": "1000.00",
        "currency": "RUB",
        "createdAt": "2025-06-08T14:02:51.133Z",
        "updatedAt": "2025-06-08T14:02:51.133Z",
      }),
      AccountModel.fromJson({
        "id": 2,
        "userId": 1,
        "name": "Долларовый счёт",
        "balance": "1500.00",
        "currency": "USD",
        "createdAt": "2025-05-01T10:30:00.000Z",
        "updatedAt": "2025-06-01T15:45:00.000Z",
      }),
    ]);

    _mockAccountResponses.addAll([
      AccountResponseModel.fromJson({
        "id": 1,
        "name": "Основной счёт",
        "balance": "1000.00",
        "currency": "RUB",
        "incomeStats": [
          {
            "categoryId": 1,
            "categoryName": "Зарплата",
            "emoji": "💰",
            "amount": "5000.00",
          },
        ],
        "expenseStats": [
          {
            "categoryId": 1,
            "categoryName": "Зарплата",
            "emoji": "💰",
            "amount": "5000.00",
          },
        ],
        "createdAt": "2025-06-08T14:02:51.133Z",
        "updatedAt": "2025-06-08T14:02:51.133Z",
      }),
      AccountResponseModel.fromJson({
        "id": 2,
        "name": "Долларовый счёт",
        "balance": "1500.00",
        "currency": "USD",
        "incomeStats": [],
        "expenseStats": [],
        "createdAt": "2025-05-01T10:30:00.000Z",
        "updatedAt": "2025-06-01T15:45:00.000Z",
      }),
    ]);
  }
}
