import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_fab.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_app_bar.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_scaffold.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BillionScaffold(
      appBar: BillionAppBar(
        title: AppLocalizations.of(context)!.appBarExpenses,
        actionIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.history),
        ),
      ),
      floatingActionButton: BillionFAB(onPressed: () {}),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Расходы')],
        ),
      ),
    );
  }
}
