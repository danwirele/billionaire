import 'package:billionaire/src/domain/models/account/account_brief_model.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/modal_bottom_sheet_extension.dart';
import 'package:flutter/material.dart';

class ChooseAccount extends StatelessWidget {
  const ChooseAccount({
    required this.accountNotifier,
    super.key,
  });

  final ValueNotifier<AccountBriefModel?> accountNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AccountBriefModel?>(
      valueListenable: accountNotifier,
      builder: (context, account, _) {
        return BillionPinnedContainer.transparentLarge(
          onTap: () async {
            final selectedAccount = await context
                .showSelectAccountBottomSheet();
            if (selectedAccount != null) {
              accountNotifier.value = AccountBriefModel.fromJson(
                selectedAccount.toJson(),
              );
            }
          },
          leading: BillionText.bodyLarge('Счет'),
          action: Row(
            children: [
              Text(account?.name ?? 'Не выбран'),
              const BillionArrowRight(),
            ],
          ),
        );
      },
    );
  }
}
