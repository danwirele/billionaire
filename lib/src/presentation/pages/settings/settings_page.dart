import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/presentation/pages/settings/widgets/code_password_editor.dart';
import 'package:billionaire/src/presentation/pages/settings/widgets/haptick_editor.dart';
import 'package:billionaire/src/presentation/pages/settings/widgets/language_editor.dart';
import 'package:billionaire/src/presentation/pages/settings/widgets/theme_switch.dart';
import 'package:billionaire/src/presentation/pages/settings/widgets/tint_picker.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BillionScaffold(
      appBar: BillionAppBar(
        title: AppLocalizations.of(context)!.appBarSettings,
      ),
      body: const Column(
        children: [
          ThemeSwitch(),
          TintPicker(),
          HaptickEditor(),
          CodePasswordEditor(),
          LanguageEditor(),
        ],
      ),
    );
  }
}
