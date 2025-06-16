import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BillionScaffold(
      appBar: BillionAppBar(
        title: AppLocalizations.of(context)!.appBarAccount,
        actionIcon: GestureDetector(
          onTap: () {},
          child: Assets.icons.edit.svg(
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              BillionColors.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      floatingActionButton: BillionFAB(onPressed: () {}),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Счет')],
        ),
      ),
    );
  }
}
