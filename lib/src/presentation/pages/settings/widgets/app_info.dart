import 'package:billionaire/src/presentation/pages/settings/widgets/settings_arrow.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;

    return BillionPinnedContainer.transparentMedium(
      leading: BillionText.bodyLarge(localization.about),
      action: const SettingsArrow(),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: BillionText.bodyLarge(
              localization.aboutReadme,
              overflow: TextOverflow.visible,
            ),

            actions: [
              TextButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                child: BillionText.bodyMedium(localization.cancel),
              ),
            ],
          ),
        );
      },
    );
  }
}
