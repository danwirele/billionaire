import 'package:billionaire/src/presentation/pages/transaction/history/controllers/end_date.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/history_transactions.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/start_date.dart';
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
    final historyTransactionsController = historyTransactionsProvider(
      isIncome: widget.isIncome,
    );

    final currencyProviderValue = ref.getCurrency();
    final startDate = ref.watch(startDateProviderProvider);
    final endDate = ref.watch(endDateProviderProvider);

    return BillionScaffold(
      appBar: const BillionAppBar(title: 'Моя история'),
      body: Column(
        children: [
          BillionPinnedContainer(
            onTap: () async {
              final dateTime = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );

              await ref
                  .read(
                    startDateProviderProvider.notifier,
                  )
                  .setPeriodStart(
                    newDate: dateTime!,
                    endDate: endDate,
                  );
            },
            leadingText: 'Начало',
            action: BillionText.bodyLarge(
              startDate.toddMMyyyy(),
            ),
          ),
          BillionPinnedContainer(
            onTap: () async {
              final dateTime = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );

              await ref
                  .read(
                    endDateProviderProvider.notifier,
                  )
                  .setPeriodEnd(
                    newDate: dateTime!,
                    startDate: startDate,
                  );
            },
            leadingText: 'Конец',
            action: BillionText.bodyLarge(
              endDate.toddMMyyyy(),
            ),
          ),
          const BillionPinnedContainer(
            leadingText: 'Сортировка',
            action: Flexible(child: Placeholder()),
          ),

          ref
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

                  return Expanded(
                    child: Column(
                      children: [
                        BillionPinnedContainer(
                          leadingText: 'Всего',
                          action: BillionText.bodyLarge(
                            '${historyTransactionStateModel.amount.formatNumber()} ${currencyProviderValue.name}',
                          ),
                        ),

                        historyTransactionStateModel
                                .transactions
                                .isEmpty
                            ? const Expanded(
                                child: Center(
                                  child: Text(
                                    'Транзакции отсуствуют',
                                  ),
                                ),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  itemCount:
                                      historyTransactionStateModel
                                          .transactions
                                          .length,
                                  itemBuilder: (context, index) {
                                    final transaction =
                                        historyTransactionStateModel
                                            .transactions[index];
                                    final category =
                                        transaction.category;

                                    return BillionStatWidget(
                                      statTitle: category.name,
                                      statDescription:
                                          transaction.comment,
                                      transactionAmount:
                                          transaction.amount,

                                      currency:
                                          currencyProviderValue.name,
                                      leadingEmoji: category.emoji,
                                    );
                                  },
                                ),
                              ),
                      ],
                    ),
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
        ],
      ),
    );
  }
}
