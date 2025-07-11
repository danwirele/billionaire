import 'package:billionaire/src/domain/controllers/connection.dart';
import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/domain/models/account/account_update_request_model.dart';
import 'package:billionaire/src/domain/repo_impl_provider/bank_account_repository_impl_di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_account_repository.g.dart';
/*
P.S. у нас по условию ДЗ 1 всего один аккаунт
Поэтому можно сделать fetch всех, и взять первый
После этого получить информацию о счете [AccountResponseModel] уже по id
*/

@Riverpod(keepAlive: true, dependencies: [Connection])
class UserAccountRepository extends _$UserAccountRepository {
  @override
  Future<AccountModel> build() async {
    final bankAccountRepo = await ref.read(
      bankAccountRepositoryImplDiProvider.future,
    );

    await ref.watch(connectionProvider.future);

    final accountsList = await bankAccountRepo.getAllBankAccounts();

    return accountsList.first;
  }

  Future<void> updateAccount(
    AccountModel updatedModel,
  ) async {
    final bankAccountRepo = await ref.read(
      bankAccountRepositoryImplDiProvider.future,
    );

    final currentAccount = state.value;
    if (currentAccount == null) {
      return;
    }

    final newModel = await bankAccountRepo.updateBankAccount(
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
