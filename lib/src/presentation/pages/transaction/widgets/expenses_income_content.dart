import 'package:billionaire/src/presentation/pages/transaction/controllers/filtered_transactions.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_stat_widget.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/dialogs_extension.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/error_helper.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/invoke_function.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExpensesIncomeContent extends StatelessWidget {
  const ExpensesIncomeContent.income({super.key}) : isIncome = true;
  const ExpensesIncomeContent.expenses({super.key}) : isIncome = false;

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    final accountTransactionRepo = filteredTransactionsProvider(
      isIncome: isIncome,
    );

    return Column(
      children: [
        Consumer(
          builder: (context, ref, child) {
            final currencyProviderValue = ref.getCurrency();

            return BillionPinnedContainer.primaryMedium(
              leading: BillionText.bodyLarge('Всего'),
              action: ref
                  .watch(accountTransactionRepo)
                  .when(
                    data: (transactionStateModel) {
                      final amountText = transactionStateModel?.amount.formatNumber() ?? 'Информация отсутствует';

                      return BillionText.bodyLarge(
                        '$amountText ${currencyProviderValue.char}',
                      );
                    },
                    error: (error, stackTrace) {
                      final errorMessage = ErrorHelper.whenError(error);

                      return BillionText.bodyMedium(
                        errorMessage,
                        maxLines: 10,
                      );
                    },
                    loading: () => BillionText.bodyLarge(
                      'Загрузка...',
                    ),
                  ),
            );
          },
        ),
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              final currencyProviderValue = ref.getCurrency();

              return ref
                  .watch(accountTransactionRepo)
                  .when(
                    data: (transactionStateModel) {
                      if (transactionStateModel == null) {
                        return const Center(
                          child: Text(
                            'Извините, произошла ошибка, счет не найден',
                          ),
                        );
                      }

                      if (transactionStateModel.transactions.isEmpty) {
                        return const Center(
                          child: Text(
                            'Список транзакций пуст',
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: transactionStateModel.transactions.length,
                        itemBuilder: (context, index) {
                          final transaction = transactionStateModel.transactions[index];
                          final category = transaction.category;

                          return BillionStatWidget(
                            actionCallBack: () async {
                              await context.invokeMethodWrapper(
                                () async {
                                  await context.showTransactionActionDialog(
                                    model: transaction,
                                    isIncome: isIncome,
                                  );
                                },
                              );
                            },
                            statTitle: category.name,
                            statDescription: transaction.comment,
                            action: BillionText.bodyLarge(
                              '${transaction.amount} ${currencyProviderValue.char}',
                            ),
                            leadingEmoji: category.emoji,
                          );
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      final errorMessage = ErrorHelper.whenError(error);

                      return Center(
                        child: BillionText.bodyMedium(
                          errorMessage,
                          maxLines: 10,
                        ),
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: BillionColors.primaryContainer,
                        color: BillionColors.primary,
                      ),
                    ),
                  );
            },
          ),
        ),
      ],
    );
  }
}
