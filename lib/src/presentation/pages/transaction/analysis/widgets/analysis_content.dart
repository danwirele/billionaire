import 'dart:math';

import 'package:billion_charts_package/billion_charts_package.dart';
import 'package:billionaire/src/presentation/pages/transaction/analysis/controllers/analysis_state.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_stat_widget.dart';
import 'package:billionaire/src/presentation/shared/controllers/currency_provider.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/error_helper.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/modal_bottom_sheet_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnalysisContent extends ConsumerWidget {
  const AnalysisContent({
    required this.isIncome,
    super.key,
  });

  final bool isIncome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analysisProvider = analysisStateProvider(
      isIncome: isIncome,
    );

    final colorScheme = context.colorScheme;

    return Consumer(
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
                final random = Random();
                final Set<Color> uniqueColors = {};
                while (uniqueColors.length <
                    analysisStateList.length) {
                  final color = Color.fromRGBO(
                    random.nextInt(256),
                    random.nextInt(256),
                    random.nextInt(256),
                    1,
                  );
                  uniqueColors.add(color);
                }
                final randomColors = uniqueColors.toList();

                return Column(
                  children: [
                    BillionPinnedContainer.transparentMedium(
                      leading: BillionText.bodyLarge(
                        'Сумма',
                      ),
                      action: BillionText.bodyLarge(
                        '${analysisState.summaryAmount.toStringAsFixed(0)} ${currency.char}',
                      ),
                    ),
                    const SizedBox(height: 20),
                    BillionPieChart(
                      config: BillionPieChartConfig(
                        legends: List.generate(
                          analysisStateList.length,
                          (index) {
                            final analysisElement =
                                analysisStateList[index];
                            return LegendEntity(
                              percentage: analysisElement.percentage,
                              title: analysisElement.category.name,
                              sectionColor: randomColors[index],
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    const BillionDivider(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: analysisStateList.length,
                        itemBuilder: (context, index) {
                          final analysisElement =
                              analysisStateList[index];

                          return GestureDetector(
                            onTap: () {
                              context.showDetailsTransactions(
                                analysisElement.transactions,
                              );
                            },
                            child: BillionStatWidget(
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
                              leadingEmoji:
                                  analysisElement.category.emoji,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              error: (error, stackTrace) {
                final errorMessage = ErrorHelper.whenError(error);

                return BillionText.bodyMedium(errorMessage);
              },
              loading: () => Center(
                child: CircularProgressIndicator(
                  backgroundColor: colorScheme.primaryContainer,
                  color: colorScheme.primary,
                ),
              ),
            );
      },
    );
  }
}
