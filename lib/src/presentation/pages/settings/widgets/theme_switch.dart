import 'package:billionaire/src/presentation/shared/controllers/theme.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider).value;
    final themeController = ref.read(themeProvider.notifier);
    final value = theme?.mode == ThemeMode.system;

    return BillionPinnedContainer.transparentMedium(
      leading: BillionText.bodyLarge('Светлая/системная'),
      action: Switch.adaptive(
        value: value,
        onChanged: (value) async {
          await themeController.toggleTheme();
        },
      ),
    );
  }
}
