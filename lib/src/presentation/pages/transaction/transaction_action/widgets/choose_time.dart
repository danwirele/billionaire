import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class ChooseTime extends StatelessWidget {
  const ChooseTime({
    required this.timeNotifier,
    super.key,
  });

  final ValueNotifier<TimeOfDay> timeNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TimeOfDay>(
      valueListenable: timeNotifier,
      builder: (context, time, _) {
        return BillionPinnedContainer.transparentLarge(
          onTap: () async {
            final newTime = await showTimePicker(
              context: context,
              useRootNavigator: false,
              initialTime: time,
            );
            if (newTime != null) {
              timeNotifier.value = newTime;
            }
          },
          leading: BillionText.bodyLarge('Время'),
          action: Row(
            children: [
              BillionText.bodyLarge('${time.hour}:${time.minute}'),
              const BillionArrowRight(),
            ],
          ),
        );
      },
    );
  }
}
