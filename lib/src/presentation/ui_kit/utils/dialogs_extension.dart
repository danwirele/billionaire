import 'package:billionaire/src/domain/models/account/account_model.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/presentation/pages/account/controllers/update_account.dart';
import 'package:billionaire/src/presentation/pages/transaction/transaction_action/transaction_action_page.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/text_input_formatters.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

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
              title: BillionText.bodyMedium(
                localization.newAccountName,
              ),
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
                  child: BillionText.bodyMedium(localization.cancel),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final newName = nameController.text.trim();

                    if (newName.isNotEmpty) {
                      await ref.read(updateAccountProvider.notifier).updateAccount(name: newName);
                      GoRouter.of(this).pop();
                    }
                  },
                  child: BillionText.bodyMedium(localization.save),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<String?> showSetTransactionAmountDialog({
    String? initialAmount,
  }) async {
    return showDialog<String>(
      context: this,
      useRootNavigator: false,
      builder: (context) {
        return HookBuilder(
          builder: (context) {
            final amountTextEditingController = useTextEditingController(text: initialAmount);

            // Получаем правильный разделитель из текущей локали
            final locale = Localizations.localeOf(context);
            final format = NumberFormat.decimalPattern('$locale');
            final validDecimalSeparator = format.symbols.DECIMAL_SEP;

            return AlertDialog(
              title: BillionText.bodyMedium(localization.transactionAmount),
              content: TextField(
                autofocus: true,
                controller: amountTextEditingController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  LocalizedDecimalAndThousandInputFormatter(
                    validDecimalSeparator: validDecimalSeparator,
                  ),
                ],
                decoration: InputDecoration(
                  hintText: localization.enterAmount,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).pop(amountTextEditingController.text);
                  },
                  child: BillionText.bodyMedium(localization.cancel),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final amount = amountTextEditingController.text.trim();

                    GoRouter.of(context).pop(amount);
                  },
                  child: BillionText.bodyMedium(localization.save),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<String?> showSetTransactionCommentDialog({
    String? initialComment,
  }) {
    return showDialog(
      context: this,
      useRootNavigator: false,
      builder: (context) {
        return HookBuilder(
          builder: (context) {
            final commentTextEditingController = useTextEditingController(text: initialComment);

            return AlertDialog(
              title: BillionText.bodyMedium(
                localization.newTransactionComment,
              ),
              content: TextField(
                controller: commentTextEditingController,
                decoration: InputDecoration(
                  hintText: localization.comment,
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  child: BillionText.bodyMedium(localization.cancel),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final comment = commentTextEditingController.text.trim();

                    GoRouter.of(context).pop(comment);
                  },
                  child: BillionText.bodyMedium(localization.save),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Метод для показа диалога с ошибкой
  void showValidationDialog({required List<String> errorList}) {
    showDialog<void>(
      context: this,
      useRootNavigator: false,
      builder: (context) => AlertDialog(
        title: BillionText.titleMedium(localization.error),
        content: BillionText.bodyMedium(
          '${localization.pleaseFillFollowingFields}:${errorList.join(', ')}',
          overflow: TextOverflow.visible,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: BillionText.bodyMedium('ОК'),
          ),
        ],
      ),
    );
  }

  Future<void> showTransactionActionDialog({
    required bool isIncome,
    TransactionResponseModel? model,
  }) async => showGeneralDialog(
    context: this,
    barrierDismissible: true,
    requestFocus: true,
    barrierLabel: 'barrier',
    pageBuilder: (context, animation, secondaryAnimation) {
      return TransactionActionPage(
        model: model,
        isIncome: isIncome,
      );
    },
  );
}
