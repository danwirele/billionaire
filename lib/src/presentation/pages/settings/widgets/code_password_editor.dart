import 'package:billionaire/src/presentation/pages/settings/widgets/settings_arrow.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CodePasswordEditor extends StatelessWidget {
  const CodePasswordEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return BillionPinnedContainer.transparentMedium(
      onTap: () {
        GoRouter.of(context).pushNamed(RoutesUtil.pincodePageName);
      },
      leading: BillionText.bodyLarge('Код пароль'),
      action: const SettingsArrow(),
    );
  }
}
