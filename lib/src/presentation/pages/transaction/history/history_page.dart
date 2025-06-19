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
    final filter = ref.read(transactionFilterProvider);
    return BillionScaffold(
      appBar: const BillionAppBar(title: 'Моя история'),
      body: Column(
        children: [
          BillionPinnedContainer(
            onTap: () async {
              final newDate = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                initialDate: ref.watch(dateProvider).$1,
              );

              if (newDate != null) {
                await ref
                    .read(dateProvider.notifier)
                    .setStartDate(newDate);
              }
            },
            leadingText: 'Начало',
            action: BillionText.bodyLarge(
              ref.watch(dateProvider).$1.toddMMyyyy(),
            ),
          ),
          BillionPinnedContainer(
            onTap: () async {
              final newDate = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                initialDate: ref.watch(dateProvider).$2,
              );

              if (newDate != null) {
                await ref
                    .read(dateProvider.notifier)
                    .setEndDate(newDate);
              }
            },
            leadingText: 'Конец',
            action: BillionText.bodyLarge(
              ref.watch(dateProvider).$2.toddMMyyyy(),
            ),
          ),

          BillionPinnedContainer(
            onTap: () async => context.showFilterBottomSheet(),
            leadingText: 'Сортировка',
            action: BillionText.bodyLarge(
              filter?.displayName ?? 'Выберите фильтр',
            ),
          ),

          Expanded(
            child: Center(
              child: ref
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
                        historyTransactionStateModel:
                            historyTransactionStateModel,
                      );
                    },
                    error: (error, stackTrace) => Text(
                      error.toString(),
                    ),
                    loading: () => const CircularProgressIndicator(
                      backgroundColor: BillionColors.onPrimary,
                      color: BillionColors.primary,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
