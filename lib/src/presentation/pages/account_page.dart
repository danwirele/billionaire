import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_app_bar.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_fab.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BillionScaffold(
      appBar: BillionAppBar(
        title: AppLocalizations.of(context)!.appBarAccount,
        actionIcon: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.icons.edit.path),
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
