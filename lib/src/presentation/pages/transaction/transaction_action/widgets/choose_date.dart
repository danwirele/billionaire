import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class ChooseDate extends StatelessWidget {
  const ChooseDate({
    required this.dateNotifier,
    super.key,
  });

  final ValueNotifier<DateTime> dateNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: dateNotifier,
      builder: (context, date, _) {
        return BillionPinnedContainer.transparentLarge(
          onTap: () async {
            final newDate = await showDatePicker(
              context: context,
              useRootNavigator: false,
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
              initialDate: date,
            );
            if (newDate != null) {
              dateNotifier.value = newDate;
            }
          },
          leading: BillionText.bodyLarge('Дата'),
          action: Row(
            children: [
              BillionText.bodyLarge(date.toString().split(' ')[0]),
              const BillionArrowRight(),
            ],
          ),
        );
      },
    );
  }
}
