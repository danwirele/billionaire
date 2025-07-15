import 'package:billionaire/src/domain/controllers/user_account_repository.dart';
import 'package:billionaire/src/domain/models/account/account_brief_model.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_request.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/presentation/pages/transaction/transaction_action/controllers/transaction_action.dart';
import 'package:billionaire/src/presentation/pages/transaction/transaction_action/widgets/choose_account.dart';
import 'package:billionaire/src/presentation/pages/transaction/transaction_action/widgets/choose_amount.dart';
import 'package:billionaire/src/presentation/pages/transaction/transaction_action/widgets/choose_category.dart';
import 'package:billionaire/src/presentation/pages/transaction/transaction_action/widgets/choose_comment.dart';
import 'package:billionaire/src/presentation/pages/transaction/transaction_action/widgets/choose_date.dart';
import 'package:billionaire/src/presentation/pages/transaction/transaction_action/widgets/choose_time.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/dialogs_extension.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionActionPage extends HookConsumerWidget {
  const TransactionActionPage({
    required this.isIncome,
    this.model,
    super.key,
  });

  final TransactionResponseModel? model;
  final bool isIncome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = context.colorScheme;

    final userAccount = ref.read(userAccountRepositoryProvider).value;

    final accountNotifier = useValueNotifier<AccountBriefModel?>(
      AccountBriefModel.fromJson(userAccount!.toJson()),
    );
    final categoryNotifier = useValueNotifier<CategoryModel?>(
      model?.category,
    );
    final amountNotifier = useValueNotifier<String>(
      model?.amount ?? '',
    );
    final dateNotifier = useValueNotifier<DateTime>(
      model?.transactionDate ?? DateTime.now(),
    );
    final timeNotifier = useValueNotifier<TimeOfDay>(TimeOfDay.now());
    final commentNotifier = useValueNotifier<String?>(model?.comment);

    // Проверка валидности данных перед сохранением
    bool isValid() {
      return accountNotifier.value != null && categoryNotifier.value != null && amountNotifier.value.isNotEmpty;
    }

    return BillionScaffold(
      appBar: BillionAppBar(
        leading: IconButton(
          onPressed: GoRouter.of(context).pop,
          icon: const Icon(Icons.close),
        ),
        title: model == null ? context.localization.addition : context.localization.editing,
        actionIcon: IconButton(
          icon: Icon(
            Icons.check,
            size: 24,
            color: colorScheme.onSurfaceVariant,
          ),
          onPressed: () async {
            if (isValid()) {
              final transaction = TransactionRequestModel(
                accountId: userAccount.id,
                categoryId: categoryNotifier.value!.id,
                amount: amountNotifier.value.replaceAll(' ', ''),
                transactionDate: DateTime(
                  dateNotifier.value.year,
                  dateNotifier.value.month,
                  dateNotifier.value.day,
                  timeNotifier.value.hour,
                  timeNotifier.value.minute,
                ),
                comment: commentNotifier.value,
              );

              if (context.mounted) {
                context.pop();
              }

              await ref
                  .read(
                    transactionActionProvider(model: model).notifier,
                  )
                  .saveTransaction(
                    newModel: transaction,
                    transactionId: model?.id,
                  );
            } else {
              final errorList = <String>[];

              if (accountNotifier.value == null) {
                errorList.add(context.localization.errorAccount);
              }
              if (categoryNotifier.value == null) {
                errorList.add(context.localization.errorCategory);
              }
              if (amountNotifier.value.isEmpty) {
                errorList.add(context.localization.errorAmount);
              }

              // Показываем диалог с ошибкой
              context.showValidationDialog(errorList: errorList);
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChooseAccount(accountNotifier: accountNotifier),
            ChooseCategory(
              categoryNotifier: categoryNotifier,
              isIncome: isIncome,
            ),
            ChooseAmount(amountNotifier: amountNotifier),
            ChooseDate(dateNotifier: dateNotifier),
            ChooseTime(timeNotifier: timeNotifier),
            ChooseComment(commentNotifier: commentNotifier),
            if (model != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () async {
                    if (context.mounted) {
                      context.pop();
                    }

                    await ref
                        .read(
                          transactionActionProvider(
                            model: model,
                          ).notifier,
                        )
                        .deleteTransaction(
                          transactionId: model!.id,
                        );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      colorScheme.error,
                    ),
                    foregroundColor: WidgetStatePropertyAll(
                      colorScheme.onPrimary,
                    ),
                  ),
                  child: BillionText.labelLarge(
                    context.localization.deleteTransaction,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
