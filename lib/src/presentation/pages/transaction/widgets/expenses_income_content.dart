import 'package:billionaire/src/domain/controllers/account_transactions_repository.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_pinned_container.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_stat_widget.dart';
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
    final accountTransactionRepo = transactionsRepositoryProvider(
      isIncome: isIncome,
    );

    return Consumer(
      builder: (context, ref, child) {
        final currencyProviderValue = ref.getCurrency();

        return ref
            .watch(accountTransactionRepo)
            .when(
              data: (transactionList) {
                if (transactionList == null) {
                  return Center(
                    child: Text(
                      'Извините, произошла ошибка, счет не найден',
                    ),
                  );
                }

                if (transactionList.isEmpty) {
                  return Center(
                    child: Text(
                      'Отсутствуют информации о транзакциях',
                    ),
                  );
                }

                // final transactionAmmountSum = ref
                //     .read(accountTransactionRepo.notifier)
                //     .getTransactionAmmount();

                return Column(
                  children: [
                    // BillionPinnedContainer(
                    //   leadingText: 'Всего',
                    //   action: BillionText.bodyLarge(
                    //     '${(transactionAmmountSum).formatNumber()} $currencyProviderValue',
                    //   ),
                    // ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: transactionList.length,
                        itemBuilder: (context, index) {
                          final transaction = transactionList[index];
                          final category = transaction.category;

                          return BillionStatWidget(
                            statTitle: category.name,
                            statDescription: transaction.comment,
                            transactionAmount: transaction.amount,

                            currency: currencyProviderValue.name,
                            leadingEmoji: category.emoji,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => Center(
                child: CircularProgressIndicator(
                  backgroundColor: BillionColors.onPrimary,
                  color: BillionColors.primary,
                ),
              ),
            );
      },
    );
  }
}
