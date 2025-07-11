import 'package:billionaire/core/utils/conecction_extension.dart';
import 'package:billionaire/src/data/datasources/local/bank_account_local_datasource.dart';
import 'package:billionaire/src/data/datasources/remote/bank_account_datasource.dart';
import 'package:billionaire/src/data/db/db.dart';
import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/domain/models/account/account_response_model.dart';
import 'package:billionaire/src/domain/models/account/account_update_request_model.dart';
import 'package:billionaire/src/domain/repositories/bank_account_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';

class BankAccountRepositoryImpl implements BankAccountRepository {
  BankAccountRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.database,
  });

  static final Connectivity connectivity = Connectivity();

  final BankAccountLocalDatasource localDatasource;
  final Database database;
  final BankAccountRemoteDatasource remoteDatasource;

  @override
  @override
  Future<List<AccountModel>> getAllBankAccounts() async {
    final hasConnection = await connectivity.hasConnection();

    if (hasConnection) {
      // Если есть подключение, создаем транзакцию через datasource
      final accounts = await remoteDatasource.getAllAccounts();

      await localDatasource.saveAllAccounts(
        accountList: accounts
            .map(
              (e) => AccountTableCompanion.insert(
                id: e.id,
                userId: e.userId,
                name: e.name,
                currency: e.currency,
                balance: e.balance,
                createdAt: e.createdAt,
                updatedAt: e.updatedAt,
              ),
            )
            .toList(),
      );

      return accounts;
    } else {
      final accounts = await localDatasource.getAllAccounts();

      final modelAccounts = accounts.map(
        (e) {
          return AccountModel(
            id: e.id,
            userId: e.userId,
            balance: e.balance,
            createdAt: e.createdAt,
            currency: e.currency,
            name: e.name,
            updatedAt: e.updatedAt,
          );
        },
      ).toList();
      return modelAccounts;
    }
  }

  @override
  Future<AccountResponseModel> getBankAccountById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<AccountModel?> updateBankAccount({
    required int id,
    required AccountUpdateRequestModel updatedModel,
  }) async {
    final hasConnection = await connectivity.hasConnection();

    if (hasConnection) {
      // Если есть подключение, создаем транзакцию через datasource
      final account = await remoteDatasource.updateBankAccount(
        id: id,
        updatedModel: updatedModel,
      );

      await localDatasource.updateAccount(
        updatedModel: AccountTableCompanion(
          id: Value(id),
          name: Value(updatedModel.name),
          balance: Value(updatedModel.balance),
          currency: Value(updatedModel.currency),
        ),
      );

      return account;
    } else {
      return null;
    }
  }
}
