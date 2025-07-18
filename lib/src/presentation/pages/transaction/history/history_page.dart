import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/date.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/history_transactions.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/transaction_filter.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/widgets/history_transactions_content.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/error_helper.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
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
    final colorScheme = context.colorScheme;

    return BillionScaffold(
      appBar: BillionAppBar(
        title: context.localization.myHistory,
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
            colorFilter: ColorFilter.mode(
              colorScheme.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final date = ref.watch(dateProvider);

              return Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: date.startDate,
                    builder: (context, value, child) =>
                        BillionPinnedContainer.primaryMedium(
                          onTap: () async {
                            final newDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                              initialDate: value,
                            );

                            if (newDate != null) {
                              await ref
                                  .read(dateProvider.notifier)
                                  .setStartDate(newDate);
                            }
                          },
                          leading: BillionText.bodyLarge(
                            context.localization.beginning,
                          ),
                          action: BillionText.bodyLarge(
                            value.toddMMyyyy(),
                          ),
                        ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: date.endDate,
                    builder: (context, value, child) =>
                        BillionPinnedContainer.primaryMedium(
                          onTap: () async {
                            final newDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                              initialDate: value,
                            );

                            if (newDate != null) {
                              await ref
                                  .read(dateProvider.notifier)
                                  .setEndDate(newDate);
                            }
                          },
                          leading: BillionText.bodyLarge(
                            context.localization.ending,
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
              return BillionPinnedContainer.primaryMedium(
                onTap: () async => context.showFilterBottomSheet(),
                leading: BillionText.bodyLarge(
                  context.localization.sorting,
                ),
                action: BillionText.bodyLarge(
                  filter?.filterName ??
                      context.localization.selectFilter,
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
                            return Text(
                              context
                                  .localization
                                  .sorryErrorOccurredNoAccount,
                            );
                          }

                          return HistoryTransactionsContent(
                            currencyProviderValue:
                                currencyProviderValue,
                            historyTransactionStateModel:
                                historyTransactionStateModel,
                          );
                        },
                        error: (error, stackTrace) {
                          final errorMessage = context.whenError(
                            error,
                          );

                          return BillionText.bodyMedium(
                            errorMessage,
                          );
                        },
                        loading: () => CircularProgressIndicator(
                          backgroundColor:
                              colorScheme.primaryContainer,
                          color: colorScheme.primary,
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
