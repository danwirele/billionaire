import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/presentation/shared/controllers/currency_provider.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/modal_bottom_sheet_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrencySelector extends ConsumerWidget {
  const CurrencySelector({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = ref.watch(currencyProviderProvider);

    return BillionPinnedContainer.primaryMedium(
      onTap: () async {
        await context.showCurrencyBottomSheet();
      },
      leading: const BillionText.bodyLarge('Валюта'),
      action: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          BillionText.bodyLarge(
            currency.char,
          ),
          Assets.icons.moreVert.svg(
            colorFilter: ColorFilter.mode(
              BillionColors.tertiary.withValues(
                alpha: 0.3,
              ),
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
