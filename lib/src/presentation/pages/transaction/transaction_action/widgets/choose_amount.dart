import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/dialogs_extension.dart';
import 'package:flutter/material.dart';

class ChooseAmount extends StatelessWidget {
  const ChooseAmount({
    required this.amountNotifier,
    super.key,
  });

  final ValueNotifier<String> amountNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: amountNotifier,
      builder: (context, amount, _) {
        return BillionPinnedContainer.transparentLarge(
          onTap: () async {
            final newAmount = await context
                .showSetTransactionAmountDialog(
                  initialAmount: amount,
                );
            if (newAmount != null) {
              amountNotifier.value = newAmount;
            }
          },
          leading: BillionText.bodyLarge('Сумма'),
          action: Row(
            children: [
              Text(amount.isEmpty ? 'Не указана' : amount),
              const BillionArrowRight(),
            ],
          ),
        );
      },
    );
  }
}
