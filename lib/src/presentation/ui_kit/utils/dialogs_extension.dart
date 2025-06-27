import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/presentation/pages/account/controllers/update_account.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension DialogExtension on BuildContext {
  Future<void> showChangeAccountNameDialog(
    AccountModel updateAccountModel,
  ) async {
    await showDialog<void>(
      context: this,
      builder: (context) {
        return HookConsumer(
          builder: (context, ref, child) {
            final nameController = useTextEditingController(
              text: updateAccountModel.name,
            );

            return AlertDialog(
              title: const Text('Новое название счета'),
              content: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelStyle: BillionTextStyle.labelMedium,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  child: const Text('Отмена'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final newName = nameController.text.trim();

                    if (newName.isNotEmpty) {
                      await ref
                          .read(updateAccountProvider.notifier)
                          .updateAccount(name: newName);
                      GoRouter.of(this).pop();
                    }
                  },
                  child: const Text('Сохранить'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
