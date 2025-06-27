import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/presentation/shared/controllers/currency_provider.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_pinned_container.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/modal_bottom_sheet_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrencySelector extends ConsumerWidget {
  const CurrencySelector({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = ref.watch(currencyProviderProvider);

    return BillionPinnedContainer(
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
          SvgPicture.asset(
            Assets.icons.moreVert.path,
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
