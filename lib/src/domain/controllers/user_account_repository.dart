import 'package:billionaire/src/data/db/db_provider.dart';
import 'package:billionaire/src/data/remote/mock_repository_impl/mock_bank_account_repository_impl.dart';
import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/domain/models/account/account_update_request_model.dart';
import 'package:billionaire/src/domain/repositories/bank_account_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_account_repository.g.dart';
/*
P.S. у нас по условию ДЗ 1 всего один аккаунт
Поэтому можно сделать fetch всех, и взять первый
После этого получить информацию о счете [AccountResponseModel] уже по id
*/

@Riverpod(keepAlive: true)
class UserAccountRepository extends _$UserAccountRepository {
  late final BankAccountRepository accountRepo;

  @override
  Future<AccountModel?> build() async {
    final database = await ref.read(dbProviderProvider.future);

    accountRepo = MockBankAccountRepositoryImpl(database: database);
    final accountsList = await accountRepo.getAllBankAccounts();

    if (accountsList.isEmpty) return null;

    return accountsList.first;
  }

  Future<void> updateAccount(
    AccountModel updatedModel,
  ) async {
    final currentAccount = state.value;
    if (currentAccount == null) {
      return;
    }

    final newModel = await accountRepo.updateBankAccount(
      id: updatedModel.id,
      updatedModel: AccountUpdateRequestModel(
        balance: updatedModel.balance,
        currency: updatedModel.currency,
        name: updatedModel.name,
      ),
    );

    if (newModel == null) return;

    state = AsyncData(newModel);
  }
}
