import 'package:billionaire/src/presentation/shared/controllers/haptics_controller.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vibration/vibration.dart';

class HaptickEditor extends ConsumerWidget {
  const HaptickEditor({super.key});

  Future<void> _playHapticFeedback() async {
    if (await Vibration.hasCustomVibrationsSupport()) {
      await Vibration.vibrate(
        pattern: [0, 50],
        intensities: [0, 7],
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hapticsEnabled = ref
        .watch(haptickControllerProvider)
        .value!;

    return BillionPinnedContainer.transparentMedium(
      leading: BillionText.bodyLarge(context.localization.haptics),
      action: Switch(
        value: hapticsEnabled,
        onChanged: (value) async {
          await ref
              .read(haptickControllerProvider.notifier)
              .setHapticsEnabled(isEnabled: value);
          if (value) {
            await _playHapticFeedback();
          }
        },
      ),
      onTap: () async {
        final newValue = !hapticsEnabled;
        await ref
            .read(haptickControllerProvider.notifier)
            .setHapticsEnabled(isEnabled: newValue);
        if (newValue) {
          await _playHapticFeedback();
        }
      },
    );
  }
}
