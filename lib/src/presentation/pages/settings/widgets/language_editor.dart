import 'package:billionaire/core/enum/localization_enum.dart';
import 'package:billionaire/src/presentation/pages/settings/widgets/settings_arrow.dart';
import 'package:billionaire/src/presentation/shared/controllers/app_locale.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LanguageEditor extends StatelessWidget {
  const LanguageEditor({super.key});

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        final colorScheme = context.colorScheme;
        final localization = context.localization;

        return Consumer(
          builder: (context, ref, child) {
            final appLocale = ref.read(appLocaleProvider).value!;

            final currentEnum = enumFromLocale(appLocale);

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Русский'),
                    trailing: currentEnum == LocalizationEnum.ru
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () {
                      ref
                          .read(appLocaleProvider.notifier)
                          .updateLocale(LocalizationEnum.ru);
                      Navigator.of(context).pop();
                    },
                  ),
                  const BillionDivider(),
                  ListTile(
                    title: const Text('English'),
                    trailing: currentEnum == LocalizationEnum.en
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () {
                      ref
                          .read(appLocaleProvider.notifier)
                          .updateLocale(LocalizationEnum.en);
                      Navigator.of(context).pop();
                    },
                  ),
                  const BillionDivider(),
                  ListTile(
                    title: Text(localization.system),
                    trailing: currentEnum == LocalizationEnum.system
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () {
                      ref
                          .read(appLocaleProvider.notifier)
                          .updateLocale(LocalizationEnum.system);
                      Navigator.of(context).pop();
                    },
                  ),
                  const BillionDivider(),
                  ListTile(
                    tileColor: colorScheme.error,
                    leading: Icon(
                      Icons.cancel_outlined,
                      size: 24,
                      color: colorScheme.onPrimary,
                    ),
                    title: BillionText.bodyMedium(
                      localization.cancel,
                      color: Colors.white,
                    ),
                    onTap: Navigator.of(context).pop,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BillionPinnedContainer.transparentMedium(
      leading: BillionText.bodyLarge(context.localization.language),
      action: const SettingsArrow(),
      onTap: () => _showLanguageBottomSheet(context),
    );
  }
}
