import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/presentation/pages/transaction/transaction_action/transaction_action_page.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/expenses_income_content.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          icon: const Icon(
            Icons.history,
            size: 24,
            color: BillionColors.onSurfaceVariant,
          ),
        ),
      ),
      floatingActionButton: BillionFAB(
        onPressed: () async {
          await showGeneralDialog(
            context: context,
            useRootNavigator: false,
            barrierDismissible: true,
            barrierLabel: 'barrier',
            requestFocus: true,
            pageBuilder: (context, animation, secondaryAnimation) {
              return TransactionActionPage();
            },
          );
        },
      ),
      body: const ExpensesIncomeContent.income(),
    );
  }
}
