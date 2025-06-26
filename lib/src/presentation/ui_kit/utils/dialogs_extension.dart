import 'package:billionaire/src/presentation/pages/account/controllers/update_account.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension DialogExtension on BuildContext {
  Future<void> showChangeAccountNameDialog(
    UpdateAccountStateModel updateAccountStateModels,
  ) async {
    await showDialog<void>(
      context: this,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            return AlertDialog(
              title: Text(updateAccountStateModels.account.name),
              content: TextField(
                controller: updateAccountStateModels.nameController,
                decoration: const InputDecoration(
                  labelText: 'Введите новое название счета',
                  labelStyle: BillionTextStyle.labelMedium,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Отмена'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final newName = updateAccountStateModels
                        .nameController
                        .text
                        .trim();

                    if (newName.isNotEmpty) {
                      await ref
                          .read(updateAccountProvider.notifier)
                          .updateAccount(name: newName);
                      Navigator.of(this).pop();
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
