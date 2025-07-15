import 'package:billionaire/src/presentation/pages/settings/widgets/settings_arrow.dart';
import 'package:billionaire/src/presentation/shared/controllers/theme.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TintPicker extends ConsumerWidget {
  const TintPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeController = ref.read(themeProvider.notifier);

    return BillionPinnedContainer.transparentMedium(
      onTap: () async {
        final color = await showDialog<Color?>(
          context: context,
          builder: (context) {
            final colorScheme = context.colorScheme;
            Color? newColor;

            return AlertDialog(
              title: Text(context.localization.choosePrimaryColor),
              content: SingleChildScrollView(
                child: ColorPicker(
                  onColorChanged: (value) {
                    newColor = value;
                  },
                  pickerColor: colorScheme.primary,
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: Text(context.localization.accept),
                  onPressed: () {
                    Navigator.of(context).pop(newColor);
                  },
                ),
              ],
            );
          },
        );
        if (color == null) return;

        if (context.mounted) {
          final currentBrightness = View.of(
            context,
          ).platformDispatcher.platformBrightness;

          await themeController.setTint(color, currentBrightness);
        }
      },
      leading: BillionText.bodyLarge(context.localization.primaryColor),
      action: const SettingsArrow(),
    );
  }
}
