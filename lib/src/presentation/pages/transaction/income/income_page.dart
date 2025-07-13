import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/expenses_income_content.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/dialogs_extension.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/invoke_function.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
// import 'package:gaimon/gaimon.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vibration/vibration.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return BillionScaffold.fab(
      appBar: BillionAppBar(
        title: AppLocalizations.of(context)!.appBarIncome,
        actionIcon: IconButton(
          onPressed: () async {
            await GoRouter.of(context).pushNamed(
              RoutesUtil.historyPageName,
              pathParameters: {'isIncome': 'true'},
            );
          },
          icon: Icon(
            Icons.history,
            size: 24,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) => BillionFAB(
          onPressed: () async {
            await context.invokeMethodWrapper(() async {
              if (await Vibration.hasCustomVibrationsSupport()) {
                await Vibration.vibrate(
                  pattern: [0, 50],
                  intensities: [0, 7],
                );
              }
              if (context.mounted) {
                await context.showTransactionActionDialog(
                  isIncome: true,
                );
              }
            });
          },
        ),
      ),
      body: const ExpensesIncomeContent.income(),
    );
  }
}
