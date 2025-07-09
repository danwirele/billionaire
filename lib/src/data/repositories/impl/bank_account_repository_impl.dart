import 'package:billionaire/src/data/datasources/local/bank_account_local_datasource.dart';
import 'package:billionaire/src/data/datasources/remote/bank_account_datasource.dart';
import 'package:billionaire/src/data/db/db.dart';
import 'package:billionaire/src/domain/controllers/connection.dart';
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
              (e) => AccountTableCompanion(
                id: Value(e.id),
                userId: Value(e.userId),
                name: Value(e.name),
                currency: Value(e.currency),
                balance: Value(e.balance),
              ),
            )
            .toList(),
      );

      return accounts;
    } else {
      final accounts = await localDatasource.getAllAccounts();

      return accounts
          .map(
            (e) => AccountModel.fromJson(e.toJson()),
          )
          .toList();
    }
  }

  @override
  Future<AccountResponseModel> getBankAccountById(int id) {
    // TODO: implement getBankAccountById
    throw UnimplementedError();
  }

  @override
  Future<AccountModel?> updateBankAccount({
    required int id,
    required AccountUpdateRequestModel updatedModel,
  }) {
    // TODO: implement updateBankAccount
    throw UnimplementedError();
  }
}
