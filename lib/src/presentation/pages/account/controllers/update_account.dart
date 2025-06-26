import 'package:billionaire/src/domain/controllers/user_account_repository.dart';
import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_account.g.dart';
part 'update_account.freezed.dart';

@Riverpod(dependencies: [UserAccountRepository])
class UpdateAccount extends _$UpdateAccount {
  @override
  Future<UpdateAccountStateModel?> build() async {
    final userAccount = await ref.watch(
      userAccountRepositoryProvider.future,
    );

    if (userAccount == null) return null;

    final nameController = TextEditingController();

    ref.onDispose(
      () => nameController.dispose,
    );

    return UpdateAccountStateModel(
      account: userAccount,
      nameController: nameController,
    );
  }

  Future<void> updateAccount({
    String? name,
    String? balance,
    String? currency,
  }) async {
    final updateStateModel = state.value;
    if (updateStateModel == null) return;

    final userAccount = updateStateModel.account;

    final updatedAccount = updateStateModel.copyWith(
      account: userAccount.copyWith(
        name: name ?? userAccount.name,
        balance: balance ?? userAccount.balance,
        currency: currency ?? userAccount.currency,
      ),
    );

    // Update locally and on the server
    await ref
        .read(
          userAccountRepositoryProvider.notifier,
        )
        .updateAccount(updatedAccount.account);

    // // Update state
    // state = AsyncData(updatedAccount);
  }
}

@freezed
abstract class UpdateAccountStateModel
    with _$UpdateAccountStateModel {
  const factory UpdateAccountStateModel({
    required AccountModel account,
    required TextEditingController nameController,
  }) = _UpdateAccountStateModel;
}
