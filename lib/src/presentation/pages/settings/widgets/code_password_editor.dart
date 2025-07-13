import 'package:billionaire/src/presentation/pages/settings/widgets/settings_arrow.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class CodePasswordEditor extends StatelessWidget {
  const CodePasswordEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return BillionPinnedContainer.transparentMedium(
      leading: BillionText.bodyLarge('Код пароль'),
      action: const SettingsArrow(),
    );
  }
}
