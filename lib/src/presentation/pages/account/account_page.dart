import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/presentation/pages/account/widgets/account_balance.dart';
import 'package:billionaire/src/presentation/pages/account/widgets/currency_selector.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await GoRouter.of(context).pushNamed(
          RoutesUtil.analysisPageName,
          pathParameters: {'isIncome': 'false'},
        );
      },
    );
    return BillionScaffold(
      appBar: BillionAppBar(
        title: AppLocalizations.of(context)!.appBarAccount,
        actionIcon: IconButton(
          onPressed: () {},
          icon: Assets.icons.edit.svg(
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              BillionColors.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      floatingActionButton: BillionFAB(onPressed: () {}),
      body: const Column(
        children: [
          AccountBalance(),
          CurrencySelector(),
        ],
      ),
    );
  }
}
