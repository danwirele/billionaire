import 'package:billionaire/src/domain/controllers/user_account_repository.dart';
import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_account.g.dart';

@Riverpod(dependencies: [UserAccountRepository])
class UpdateAccount extends _$UpdateAccount {
  @override
  Future<AccountModel?> build() async {
    final userAccount = await ref.watch(
      userAccountRepositoryProvider.future,
    );

    final nameController = TextEditingController();

    ref.onDispose(nameController.dispose);

    return userAccount;
  }

  Future<void> updateAccount({
    String? name,
    String? balance,
    String? currency,
  }) async {
    final updateAccount = state.value;
    if (updateAccount == null) return;

    final userAccount = updateAccount;

    final updatedAccount = updateAccount.copyWith(
      name: name ?? userAccount.name,
      balance: balance ?? userAccount.balance,
      currency: currency ?? userAccount.currency,
    );

    await ref.read(userAccountRepositoryProvider.notifier).updateAccount(updatedAccount);
  }
}
