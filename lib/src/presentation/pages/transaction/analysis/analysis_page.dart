import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/presentation/pages/transaction/analysis/controllers/analysis_filter.dart';
import 'package:billionaire/src/presentation/pages/transaction/analysis/controllers/analysis_state.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_stat_widget.dart';
import 'package:billionaire/src/presentation/shared/controllers/currency_provider.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_pinned_container.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage.expense({super.key}) : isIncome = false;
  const AnalysisPage.income({super.key}) : isIncome = true;

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    final analysisProvider = analysisStateProvider(
      isIncome: isIncome,
    );

    return BillionScaffold(
      appBar: BillionAppBar(
        title: 'Аналитика',
        backgroundColor: BillionColors.surface,
        actionIcon: IconButton(
          onPressed: () {},
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
              final date = ref.read(analysisFilterProvider);

              return Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: date.startDate,
                    builder: (context, value, child) {
                      return BillionPinnedContainer(
                        containerColor: Colors.transparent,
                        onTap: () async {
                          final newDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                            initialDate: value,
                          );
                          if (newDate != null) {
                            await ref
                                .read(
                                  analysisFilterProvider.notifier,
                                )
                                .setStartDate(newDate);
                          }
                        },
                        leading: const BillionText.bodyLarge(
                          'Начало',
                        ),
                        action: BillionText.bodyLarge(
                          value.toddMMyyyy(),
                        ),
                      );
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: date.endDate,
                    builder: (context, value, child) =>
                        BillionPinnedContainer(
                          containerColor: Colors.transparent,
                          onTap: () async {
                            final newDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                              initialDate: value,
                            );

                            if (newDate != null) {
                              await ref
                                  .read(
                                    analysisFilterProvider.notifier,
                                  )
                                  .setEndDate(newDate);
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

          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final currency = ref.read(currencyProviderProvider);

                return ref
                    .watch(analysisProvider)
                    .when(
                      skipLoadingOnRefresh: false,
                      skipLoadingOnReload: false,
                      data: (analysisState) {
                        if (analysisState == null) {
                          return const Center(
                            child: Text('Извините произошла ошибка'),
                          );
                        }

                        final analysisStateList =
                            analysisState.stateModelsList;

                        if (analysisStateList.isEmpty) {
                          return const Center(
                            child: Text('Транзакции отсутствуют'),
                          );
                        }

                        return Column(
                          children: [
                            BillionPinnedContainer(
                              containerColor: Colors.transparent,
                              leading: const BillionText.bodyLarge(
                                'Сумма',
                              ),
                              action: BillionText.bodyLarge(
                                '${analysisState.summaryAmount.toStringAsFixed(0)} ${currency.char}',
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: analysisStateList.length,
                                itemBuilder: (context, index) {
                                  final analysisElement =
                                      analysisStateList[index];

                                  return BillionStatWidget(
                                    statTitle:
                                        analysisElement.category.name,
                                    statDescription: analysisElement
                                        .lastTransactionComment,
                                    subAction: BillionText.bodyLarge(
                                      '${analysisElement.amount} ${currency.char}',
                                    ),
                                    action: BillionText.bodyLarge(
                                      '${analysisElement.percentage.toStringAsFixed(0)}%',
                                    ),
                                    leadingEmoji: analysisElement
                                        .category
                                        .emoji,
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                      error: (error, stackTrace) => Text(
                        error.toString(),
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
      ),
    );
  }
}
