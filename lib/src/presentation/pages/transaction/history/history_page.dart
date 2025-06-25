import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/date.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/history_transactions.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/transaction_filter.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/widgets/history_transactions_content.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_pinned_container.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/filter_option_extension.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/modal_bottom_sheet_extension.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      appBar: BillionAppBar(
        title: 'Моя история',
        actionIcon: IconButton(
          onPressed: () async {
            await GoRouter.of(context).pushNamed(
              RoutesUtil.analysisPageName,
              pathParameters: {'isIncome': isIncome.toString()},
            );
          },
          icon: Assets.icons.historyOutline.svg(
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              BillionColors.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
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
                      leading: const BillionText.bodyLarge(
                        'Начало',
                      ),
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
                      leading: const BillionText.bodyLarge(
                        'Конец',
                      ),
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
                leading: const BillionText.bodyLarge('Сортировка'),
                action: BillionText.bodyLarge(
                  filter?.displayName ?? 'Выберите фильтр',
                ),
              );
            },
          ),
          Expanded(
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
                          backgroundColor: BillionColors.primaryContainer,
                          color: BillionColors.primary,
                        ),
                      );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
