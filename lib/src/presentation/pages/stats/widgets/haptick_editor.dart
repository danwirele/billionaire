import 'package:billionaire/src/presentation/pages/settings/widgets/settings_arrow.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';

class HaptickEditor extends StatelessWidget {
  const HaptickEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return BillionPinnedContainer.transparentMedium(
      leading: BillionText.bodyLarge(context.localization.haptics),
      action: const SettingsArrow(),
    );
  }
}
