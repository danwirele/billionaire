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
      body: Column(
        children: [
          const AccountBalance(),
          const CurrencySelector(),
          const SizedBox(height: 16),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3.5,
            child: BillionColumnBalanceChart(
              config: BillionColumnChartConfig(
                entities: [
                  BalanceEntity(
                    date: DateTime(2023, 10),
                    balance: 100.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 10, 2),
                    balance: -50.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 10, 3),
                    balance: 75.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 11, 4),
                    balance: 200.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 11, 5),
                    balance: -30.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 12, 6),
                    balance: 150.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 10, 7),
                    balance: 100.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 10, 8),
                    balance: -50.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 10, 9),
                    balance: 75.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 11, 10),
                    balance: 200.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 11, 11),
                    balance: -30.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 12, 12),
                    balance: 150.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 10, 13),
                    balance: 100.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 10, 14),
                    balance: -50.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 10, 16),
                    balance: 75.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 11, 17),
                    balance: 200.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 11, 18),
                    balance: -30.0,
                  ),
                  BalanceEntity(
                    date: DateTime(2023, 12, 19),
                    balance: 150.0,
                  ),
                ],
                showDaily: true,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
