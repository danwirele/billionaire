import 'package:billionaire/src/presentation/pages/transaction/history/controllers/history_transactions.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_pinned_container.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_stat_widget.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage.expense({super.key}) : isIncome = false;
  const HistoryPage.income({super.key}) : isIncome = true;

  final bool isIncome;

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final currencyProviderValue = ref.getCurrency();
    final historyTransactionsController = historyTransactionsProvider(
      isIncome: widget.isIncome,
    );
    return BillionScaffold(
      appBar: const BillionAppBar(title: 'Моя история'),
      body: ref
          .watch(historyTransactionsController)
          .when(
            data: (historyTransactionStateModel) {
              if (historyTransactionStateModel == null) {
                return const Expanded(
                  child: Center(
                    child: Text(
                      'Извините, произошла ошибка, счет не найден',
                    ),
                  ),
                );
              }

              return Column(
                children: [
                  BillionPinnedContainer(
                    onTap: () async {
                      final firstDate = historyTransactionStateModel
                          .startDateNotifier
                          .value;

                      final lastDate = historyTransactionStateModel
                          .endDateNotifier
                          .value;
                      final dateTime = await showDatePicker(
                        context: context,
                        firstDate: firstDate,
                        lastDate: lastDate,
                      );
                      print(dateTime);
                    },
                    leadingText: 'Начало',
                    action: BillionText.bodyLarge(
                      historyTransactionStateModel
                          .startDateNotifier
                          .value
                          .toddMMyyyy(),
                    ),
                  ),
                  BillionPinnedContainer(
                    leadingText: 'Конец',
                    action: BillionText.bodyLarge(
                      historyTransactionStateModel
                          .endDateNotifier
                          .value
                          .toddMMyyyy(),
                    ),
                  ),
                  const BillionPinnedContainer(
                    leadingText: 'Сортировка',
                    action: Flexible(child: Placeholder()),
                  ),
                  BillionPinnedContainer(
                    leadingText: 'Всего',
                    action: BillionText.bodyLarge(
                      '${historyTransactionStateModel.amount.formatNumber()} ${currencyProviderValue.name}',
                    ),
                  ),

                  historyTransactionStateModel.transactions.isEmpty
                      ? const Center(
                          child: Text('Транзакции отсуствуют'),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: historyTransactionStateModel
                                .transactions
                                .length,
                            itemBuilder: (context, index) {
                              final transaction =
                                  historyTransactionStateModel
                                      .transactions[index];
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
            loading: () => const Center(
              child: CircularProgressIndicator(
                backgroundColor: BillionColors.onPrimary,
                color: BillionColors.primary,
              ),
            ),
          ),
    );
  }
}
