import 'package:billionaire/src/domain/controllers/user_account_repository.dart';
import 'package:billionaire/src/domain/models/account/account_brief_model.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionActionPage extends HookConsumerWidget {
  const TransactionActionPage({
    this.model,
    super.key,
  });

  final TransactionResponseModel? model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        //TODO
        leading: IconButton(
          onPressed: GoRouter.of(context).pop,
          icon: const Icon(Icons.close),
        ),
        title: model == null ? 'Добавление' : 'Редактирование',
        actionIcon: IconButton(
          icon: const Icon(
            Icons.check,
            size: 24,
            color: BillionColors.onSurfaceVariant,
          ),
          onPressed: () async {
            if (isValid()) {
              final transaction = TransactionResponseModel(
                id: model?.id ?? 0,
                account: accountNotifier.value!,
                category: categoryNotifier.value!,
                amount: amountNotifier.value,
                transactionDate: DateTime(
                  dateNotifier.value.year,
                  dateNotifier.value.month,
                  dateNotifier.value.day,
                  timeNotifier.value.hour,
                  timeNotifier.value.minute,
                ),
                comment: commentNotifier.value,
                createdAt: model?.createdAt ?? DateTime.now(),
                updatedAt: DateTime.now(),
              );

              await ref
                  .read(
                    transactionActionProvider(model: model).notifier,
                  )
                  .saveTransaction(newTransaction: transaction);

              if (context.mounted) {
                context.pop();
              }
            } else {
              final errorList = <String>[];

              if (accountNotifier.value == null) {
                errorList.add('Счет');
              }
              if (categoryNotifier.value == null) {
                errorList.add('Статья');
              }
              if (amountNotifier.value.isEmpty) {
                errorList.add('Сумма');
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
            ChooseCategory(categoryNotifier: categoryNotifier),
            ChooseAmount(amountNotifier: amountNotifier),
            ChooseDate(dateNotifier: dateNotifier),
            ChooseTime(timeNotifier: timeNotifier),
            ChooseComment(commentNotifier: commentNotifier),
            if(model != null) Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(onPressed: () {
              },
              style: const ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(BillionColors.error),
                foregroundColor:WidgetStatePropertyAll(BillionColors.onPrimary,)
              ),
              child: BillionText.labelLarge('Удалить расход',color: BillionColors.onPrimary,),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
