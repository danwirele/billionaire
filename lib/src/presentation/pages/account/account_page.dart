import 'package:billion_charts_package/billion_column_chart/billion_column_chart_imports.dart';
import 'package:billionaire/src/presentation/pages/account/widgets/account_app_bar.dart';
import 'package:billionaire/src/presentation/pages/account/widgets/account_balance.dart';
import 'package:billionaire/src/presentation/pages/account/widgets/currency_selector.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // SchedulerBinding.instance.addPostFrameCallback(
    //   (timeStamp) {
    //     GoRouter.of(context).pushNamed(
    //       RoutesUtil.analysisPageName,
    //       pathParameters: {'isIncome': true.toString()},
    //     );
    //   },
    // );
    return BillionScaffold(
      appBar: const AccountAppBar(),
      floatingActionButton: BillionFAB(onPressed: () {}),
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

  final List<BalanceEntity> _balanceEntities = [
    // Октябрь 2023
    BalanceEntity(
      date: DateTime(2023, 10, 1),
      balance: 5000.0,
    ), // Доход (зарплата)
    BalanceEntity(
      date: DateTime(2023, 10, 2),
      balance: -1200.0,
    ), // Расход (аренда)
    BalanceEntity(
      date: DateTime(2023, 10, 3),
      balance: -300.0,
    ), // Расход (продукты)
    BalanceEntity(
      date: DateTime(2023, 10, 4),
      balance: -200.0,
    ), // Расход (транспорт)
    BalanceEntity(
      date: DateTime(2023, 10, 5),
      balance: -150.0,
    ), // Расход (развлечения)
    BalanceEntity(
      date: DateTime(2023, 10, 6),
      balance: 1000.0,
    ), // Доход (фриланс)
    BalanceEntity(
      date: DateTime(2023, 10, 7),
      balance: -500.0,
    ), // Расход (покупки)
    BalanceEntity(
      date: DateTime(2023, 10, 8),
      balance: -400.0,
    ), // Расход (услуги)
    BalanceEntity(
      date: DateTime(2023, 10, 9),
      balance: -100.0,
    ), // Расход (кафе)
    BalanceEntity(
      date: DateTime(2023, 10, 10),
      balance: -200.0,
    ), // Расход (транспорт)
    // Ноябрь 2023
    BalanceEntity(
      date: DateTime(2023, 11, 1),
      balance: 6000.0,
    ), // Доход (зарплата)
    BalanceEntity(
      date: DateTime(2023, 11, 2),
      balance: -1200.0,
    ), // Расход (аренда)
    BalanceEntity(
      date: DateTime(2023, 11, 3),
      balance: -350.0,
    ), // Расход (продукты)
    BalanceEntity(
      date: DateTime(2023, 11, 4),
      balance: -250.0,
    ), // Расход (транспорт)
    BalanceEntity(
      date: DateTime(2023, 11, 5),
      balance: -200.0,
    ), // Расход (развлечения)
    BalanceEntity(
      date: DateTime(2023, 11, 6),
      balance: 1200.0,
    ), // Доход (фриланс)
    BalanceEntity(
      date: DateTime(2023, 11, 7),
      balance: -600.0,
    ), // Расход (покупки)
    BalanceEntity(
      date: DateTime(2023, 11, 8),
      balance: -450.0,
    ), // Расход (услуги)
    BalanceEntity(
      date: DateTime(2023, 11, 9),
      balance: -150.0,
    ), // Расход (кафе)
    BalanceEntity(
      date: DateTime(2023, 11, 10),
      balance: -250.0,
    ), // Расход (транспорт)
    // Декабрь 2023
    BalanceEntity(
      date: DateTime(2023, 12, 1),
      balance: 7000.0,
    ), // Доход (зарплата + премия)
    BalanceEntity(
      date: DateTime(2023, 12, 2),
      balance: -1200.0,
    ), // Расход (аренда)
    BalanceEntity(
      date: DateTime(2023, 12, 3),
      balance: -400.0,
    ), // Расход (продукты)
    BalanceEntity(
      date: DateTime(2023, 12, 4),
      balance: -300.0,
    ), // Расход (транспорт)
    BalanceEntity(
      date: DateTime(2023, 12, 5),
      balance: -250.0,
    ), // Расход (развлечения)
    BalanceEntity(
      date: DateTime(2023, 12, 6),
      balance: 1500.0,
    ), // Доход (фриланс)
    BalanceEntity(
      date: DateTime(2023, 12, 7),
      balance: -700.0,
    ), // Расход (покупки)
    BalanceEntity(
      date: DateTime(2023, 12, 8),
      balance: -500.0,
    ), // Расход (услуги)
    BalanceEntity(
      date: DateTime(2023, 12, 9),
      balance: -200.0,
    ), // Расход (кафе)
    BalanceEntity(
      date: DateTime(2023, 12, 10),
      balance: -300.0,
    ), // Расход (транспорт)
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 3.5,
      child: Column(
        children: [
          // Панель с SegmentedButton
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SegmentedButton<bool>(
              style: const ButtonStyle(
                backgroundColor: WidgetStateProperty.fromMap(
                  {
                    WidgetState.selected:
                        BillionColors.primaryContainer,
                    WidgetState.any: BillionColors.onPrimary,
                  },
                ),
                foregroundColor: WidgetStatePropertyAll(
                  BillionColors.onSurfaceVariant,
                ),
              ),
              segments: const [
                ButtonSegment(
                  value: true,

                  label: Text('По дням'),
                ),
                ButtonSegment(
                  value: false,
                  label: Text('По месяцам'),
                ),
              ],
              selected: {_showDaily},
              onSelectionChanged: (Set<bool> newSelection) {
                setState(() {
                  _showDaily = newSelection.first;
                });
              },
            ),
          ),

          // График
          Expanded(
            child: BillionColumnBalanceChart(
              config: BillionColumnChartConfig(
                entities: _balanceEntities,
                showDaily: _showDaily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
