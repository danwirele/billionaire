import 'dart:developer' show log;

import 'package:billionaire/src/presentation/pages/transaction/controllers/filtered_transactions.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_stat_widget.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/dialogs_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                      final amountText =
                          transactionStateModel?.amount
                              .formatNumber() ??
                          'Информация отсутствует';

                      return BillionText.bodyLarge(
                        '$amountText ${currencyProviderValue.char}',
                      );
                    },
                    error: (error, stackTrace) {
                      log(error.toString());
                      log(stackTrace.toString());
                      return BillionText.bodyMedium(
                        error.toString(),
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

                      if (transactionStateModel
                          .transactions
                          .isEmpty) {
                        return const Center(
                          child: Text(
                            'Отсутствуют информации о транзакциях',
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount:
                            transactionStateModel.transactions.length,
                        itemBuilder: (context, index) {
                          final transaction = transactionStateModel
                              .transactions[index];
                          final category = transaction.category;

                          return BillionStatWidget(
                            actionCallBack: () async {
                              final account = await ref.read(
                                accountTransactionRepo.future,
                              );
                              if (account == null) {
                                if (context.mounted) {
                                  return showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: BillionText.titleLarge(
                                        'Счет не найден!',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            GoRouter.of(
                                              context,
                                            ).pop();
                                          },
                                          child:
                                              BillionText.bodyMedium(
                                                'Закрыть',
                                              ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }
                              await context
                                  .showTransactionActionDialog(
                                    model: transaction,
                                    isIncome: isIncome,
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
                    error: (error, stackTrace) =>
                        BillionText.bodyMedium(
                          error.toString(),
                          maxLines: 10,
                        ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        backgroundColor:
                            BillionColors.primaryContainer,
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
