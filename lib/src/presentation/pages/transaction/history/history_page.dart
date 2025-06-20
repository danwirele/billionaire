import 'package:billionaire/src/presentation/pages/transaction/history/controllers/date.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/history_transactions.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/transaction_filter.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/widgets/history_transactions_content.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_pinned_container.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/filter_option_extension.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/modal_bottom_sheet_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage.expense({super.key}) : isIncome = false;
  const HistoryPage.income({super.key}) : isIncome = true;

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    final historyTransactionsController = historyTransactionsProvider(
      isIncome: isIncome,
    );

    return BillionScaffold(
      appBar: const BillionAppBar(title: 'Моя история'),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final date = ref.read(dateProvider);

              return Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: date.startDate,
                    builder: (context, value, child) => BillionPinnedContainer(
                      onTap: () async {
                        final newDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                          initialDate: value,
                        );

                        if (newDate != null) {
                          await ref.read(dateProvider.notifier).setStartDate(newDate);
                        }
                      },
                      leadingText: 'Начало',
                      action: BillionText.bodyLarge(
                        value.toddMMyyyy(),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: date.endDate,
                    builder: (context, value, child) => BillionPinnedContainer(
                      onTap: () async {
                        final newDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                          initialDate: value,
                        );

                        if (newDate != null) {
                          await ref.read(dateProvider.notifier).setEndDate(newDate);
                        }
                      },
                      leadingText: 'Конец',
                      action: BillionText.bodyLarge(
                        value.toddMMyyyy(),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final filter = ref.watch(transactionFilterProvider);
              return BillionPinnedContainer(
                onTap: () async => context.showFilterBottomSheet(),
                leadingText: 'Сортировка',
                action: BillionText.bodyLarge(
                  filter?.displayName ?? 'Выберите фильтр',
                ),
              );
            },
          ),
          Flexible(
            child: Expanded(
              child: Center(
                child: Consumer(
                  builder: (context, ref, child) {
                    final currencyProviderValue = ref.getCurrency();
                    return ref
                        .watch(historyTransactionsController)
                        .when(
                          skipLoadingOnRefresh: true,
                          skipLoadingOnReload: true,
                          data: (historyTransactionStateModel) {
                            if (historyTransactionStateModel == null) {
                              return const Text(
                                'Извините, произошла ошибка, счет не найден',
                              );
                            }

                            return HistoryTransactionsContent(
                              currencyProviderValue: currencyProviderValue,
                              historyTransactionStateModel: historyTransactionStateModel,
                            );
                          },
                          error: (error, stackTrace) => Text(
                            error.toString(),
                          ),
                          loading: () => const CircularProgressIndicator(
                            backgroundColor: BillionColors.onPrimary,
                            color: BillionColors.primary,
                          ),
                        );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
