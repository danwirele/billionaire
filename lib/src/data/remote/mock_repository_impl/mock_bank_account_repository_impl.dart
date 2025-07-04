import 'package:billionaire/src/data/db/db.dart';
import 'package:billionaire/src/data/local/account_local_datasource.dart';
import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/domain/models/account/account_response_model.dart';
import 'package:billionaire/src/domain/models/account/account_update_request_model.dart';
import 'package:billionaire/src/domain/repositories/bank_account_repository.dart';
import 'package:drift/drift.dart';

class MockBankAccountRepositoryImpl implements BankAccountRepository {
  MockBankAccountRepositoryImpl({required Database database}) : _database = database {
    _accountLocalDatasource = AccountLocalDatasource(database: _database);
    resetMockData();
  }
  final Database _database;

  late final AccountLocalDatasource _accountLocalDatasource;

  final List<AccountModel> _mockAccounts = [];
  final List<AccountResponseModel> _mockAccountResponses = [];

  @override
  Future<List<AccountModel>> getAllBankAccounts() async {
    final accountDbModel = await _accountLocalDatasource.getAccount();

    if (accountDbModel == null) {
      final account = _mockAccounts.first;
      await _accountLocalDatasource.saveAccount(
        accountDbModel: AccountTableCompanion(
          apiId: Value(account.id),
          balance: Value(account.balance),
          name: Value(account.name),
          currency: Value(account.currency),
          userId: Value(account.userId),
        ),
      );

      return [account];
    }

    final accountModel = AccountModel(
      id: accountDbModel.apiId,
      userId: accountDbModel.userId,
      name: accountDbModel.name,
      balance: accountDbModel.balance,
      currency: accountDbModel.currency,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return [accountModel];
  }

  @override
  Future<AccountResponseModel> getBankAccountById(int id) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    return _mockAccountResponses.singleWhere(
      (account) => account.id == id,
      orElse: () => throw Exception('Счет с ID $id не найден'),
    );
  }

  @override
  Future<AccountModel?> updateBankAccount({
    required int id,
    required AccountUpdateRequestModel updatedModel,
  }) async {
    await _accountLocalDatasource.updateAccount(
      updatedModel: AccountTableCompanion(
        apiId: Value(id),
        name: Value(updatedModel.name),
        balance: Value(updatedModel.balance),
        currency: Value(updatedModel.currency),
      ),
    );

    final index = _mockAccounts.indexWhere(
      (account) => account.id == id,
    );

    if (index == -1) return null;

    final oldModel = _mockAccounts[index];
    _mockAccounts[index] = oldModel.copyWith(
      name: updatedModel.name,
      balance: updatedModel.balance,
      currency: updatedModel.currency,
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
        'id': 1,
        'userId': 1,
        'name': 'Основной счёт',
        'balance': '1000.00',
        'currency': 'RUB',
        'createdAt': '2025-06-08T14:02:51.133Z',
        'updatedAt': '2025-06-08T14:02:51.133Z',
      }),
      AccountModel.fromJson({
        'id': 2,
        'userId': 1,
        'name': 'Долларовый счёт',
        'balance': '1500.00',
        'currency': 'USD',
        'createdAt': '2025-05-01T10:30:00.000Z',
        'updatedAt': '2025-06-01T15:45:00.000Z',
      }),
    ]);

    _mockAccountResponses.addAll([
      AccountResponseModel.fromJson({
        'id': 1,
        'name': 'Основной счёт',
        'balance': '1000.00',
        'currency': 'RUB',
        'incomeStats': [
          {
            'categoryId': 1,
            'categoryName': 'Зарплата',
            'emoji': '',
            'amount': '5000.00',
          },
          {
            'categoryId': 2,
            'categoryName': 'Подработка',
            'emoji': '',
            'amount': '5000.00',
          },
        ],
        'expenseStats': [
          {
            'categoryId': 1,
            'categoryName': 'Аренда квартиры',
            'emoji': '🏠',
            'amount': '5000.00',
          },
          {
            'categoryId': 2,
            'categoryName': 'Одежда',
            'emoji': '👗',
            'amount': '5000.00',
          },
          {
            'categoryId': 3,
            'categoryName': 'На собачку',
            'emoji': '🐶',
            'amount': '5000.00',
          },
          {
            'categoryId': 4,
            'categoryName': 'На собачку',
            'emoji': 'PK',
            'amount': '5000.00',
          },
          {
            'categoryId': 5,
            'categoryName': 'Ремонт квартиры',
            'emoji': 'Продукты',
            'amount': '5000.00',
          },
          {
            'categoryId': 6,
            'categoryName': 'Продукты',
            'emoji': '🍭',
            'amount': '5000.00',
          },
          {
            'categoryId': 7,
            'categoryName': 'Спортзал',
            'emoji': '🏋',
            'amount': '5000.00',
          },
          {
            'categoryId': 8,
            'categoryName': 'Медицина',
            'emoji': '💊',
            'amount': '5000.00',
          },
        ],
        'createdAt': '2025-06-08T14:02:51.133Z',
        'updatedAt': '2025-06-08T14:02:51.133Z',
      }),
      AccountResponseModel.fromJson({
        'id': 2,
        'name': 'Долларовый счёт',
        'balance': '1500.00',
        'currency': 'USD',
        'incomeStats': [],
        'expenseStats': [],
        'createdAt': '2025-05-01T10:30:00.000Z',
        'updatedAt': '2025-06-01T15:45:00.000Z',
      }),
    ]);
  }
}
