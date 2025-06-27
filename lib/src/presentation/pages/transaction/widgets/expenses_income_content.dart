import 'package:billionaire/src/presentation/pages/transaction/controllers/filtered_transactions.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_stat_widget.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_pinned_container.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExpensesIncomeContent extends StatelessWidget {
  const ExpensesIncomeContent.income({super.key}) : isIncome = true;
  const ExpensesIncomeContent.expenses({super.key})
    : isIncome = false;

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    final accountTransactionRepo = filteredTransactionsProvider(
      isIncome: isIncome,
    );

    return Consumer(
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
                      'Отсутствуют информации о транзакциях',
                    ),
                  );
                }

                return Column(
                  children: [
                    BillionPinnedContainer(
                      leading: const BillionText.bodyLarge('Всего'),
                      action: BillionText.bodyLarge(
                        '${transactionStateModel.amount.formatNumber()} ${currencyProviderValue.char}',
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            transactionStateModel.transactions.length,
                        itemBuilder: (context, index) {
                          final transaction = transactionStateModel
                              .transactions[index];
                          final category = transaction.category;

                          return BillionStatWidget(
                            statTitle: category.name,
                            statDescription: transaction.comment,
                            action: BillionText.bodyLarge(
                              '${transaction.amount} ${currencyProviderValue.char}',
                            ),
                            leadingEmoji: category.emoji,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const Center(
                child: CircularProgressIndicator(
                  backgroundColor: BillionColors.primaryContainer,
                  color: BillionColors.primary,
                ),
              ),
            );
      },
    );
  }
}
