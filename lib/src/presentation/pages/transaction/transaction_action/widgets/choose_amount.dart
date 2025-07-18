import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/dialogs_extension.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChooseAmount extends ConsumerWidget {
  const ChooseAmount({
    required this.amountNotifier,
    super.key,
  });

  final ValueNotifier<String> amountNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = ref.getCurrency();
    return ValueListenableBuilder<String>(
      valueListenable: amountNotifier,
      builder: (context, amount, _) {
        return BillionPinnedContainer.transparentLarge(
          onTap: () async {
            final newAmount = await context.showSetTransactionAmountDialog(
              initialAmount: amount,
            );
            if (newAmount != null) {
              amountNotifier.value = newAmount;
            }
          },
          leading: BillionText.bodyLarge(context.localization.amount),
          action: Row(
            children: [
              BillionText.bodyLarge(amount.isEmpty ? context.localization.notSpecified : '$amount ${currency.char}'),
              const BillionArrowRight(),
            ],
          ),
        );
      },
    );
  }
}
