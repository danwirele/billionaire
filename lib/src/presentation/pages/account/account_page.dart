import 'package:billion_charts_package/billion_column_chart/billion_column_chart_imports.dart';
import 'package:billionaire/src/presentation/pages/account/controllers/chart.dart';
import 'package:billionaire/src/presentation/pages/account/widgets/account_app_bar.dart';
import 'package:billionaire/src/presentation/pages/account/widgets/account_balance.dart';
import 'package:billionaire/src/presentation/pages/account/widgets/currency_selector.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/error_helper.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BillionScaffold(
      appBar: const AccountAppBar(),
      floatingActionButton: Consumer(
        builder: (context, ref, child) => BillionFAB(
          onPressed: () async {},
        ),
      ),
      body: const Column(
        children: [
          AccountBalance(),
          CurrencySelector(),
          SizedBox(height: 16),
          TransactionChart(),
          Spacer(),
        ],
      ),
    );
  }
}

class TransactionChart extends StatefulWidget {
  const TransactionChart({
    super.key,
  });

  @override
  State<TransactionChart> createState() => _TransactionChartState();
}

class _TransactionChartState extends State<TransactionChart> {
  bool _showDaily = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 3.5,
      child: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final chartController = ref.read(
                chartProvider.notifier,
              );

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SegmentedButton<bool>(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.fromMap(
                      {
                        WidgetState.selected: colorScheme.primaryContainer,
                        WidgetState.any: colorScheme.onPrimary,
                      },
                    ),
                    foregroundColor: WidgetStatePropertyAll(
                      colorScheme.onSurfaceVariant,
                    ),
                  ),
                  segments: [
                    ButtonSegment(
                      value: true,
                      label: Text(context.localization.byDay),
                    ),
                    ButtonSegment(
                      value: false,
                      label: Text(context.localization.byMonth),
                    ),
                  ],
                  selected: {_showDaily},
                  onSelectionChanged: (Set<bool> newSelection) async {
                    if (newSelection.first) {
                      await chartController.getCurrentMonthTransactions();
                    } else {
                      await chartController.getYearTransactions();
                    }

                    setState(() {
                      _showDaily = newSelection.first;
                    });
                  },
                ),
              );
            },
          ),

          // График
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                return ref
                    .watch(chartProvider)
                    .when(
                      data: (data) {
                        return BillionColumnBalanceChart(
                          config: BillionColumnChartConfig(
                            entities: data,
                            showDaily: _showDaily,
                          ),
                        );
                      },
                      error: (error, stackTrace) {
                        final errorMessage = context.whenError(
                          error,
                        );

                        return Center(
                          child: BillionText.bodyMedium(errorMessage),
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
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
