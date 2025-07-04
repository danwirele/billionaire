import 'package:billionaire/src/domain/models/account/account_brief_model.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/modal_bottom_sheet_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChooseAccount extends ConsumerWidget {
  const ChooseAccount({
    required this.accountNotifier,
    super.key,
  });

  final ValueNotifier<AccountBriefModel?> accountNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder<AccountBriefModel?>(
      valueListenable: accountNotifier,
      builder: (context, account, _) {
        return BillionPinnedContainer.transparentLarge(
          onTap: () async {
            final selectedAccount = await context.showSelectAccountBottomSheet();
            if (selectedAccount != null) {
              accountNotifier.value = AccountBriefModel.fromJson(
                selectedAccount.toJson(),
              );
            }
          },
          leading: BillionText.bodyLarge('Счет'),
          action: Row(
            children: [
              BillionText.bodyLarge(account?.name ?? 'Не выбран'),
              const BillionArrowRight(),
            ],
          ),
        );
      },
    );
  }
}
