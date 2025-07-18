import 'package:billionaire/src/presentation/pages/transaction/widgets/expenses_income_content.dart';
import 'package:billionaire/src/presentation/shared/controllers/haptics_controller.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/dialogs_extension.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/invoke_function.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return BillionScaffold.fab(
      appBar: BillionAppBar(
        title: context.localization.appBarIncome,
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
              final hapticsEnabled = ref
                  .read(haptickControllerProvider)
                  .value!;

              final hapticsNotifier = ref.read(
                haptickControllerProvider.notifier,
              );

              if (hapticsEnabled) {
                await hapticsNotifier.triggerLightHaptic();
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
