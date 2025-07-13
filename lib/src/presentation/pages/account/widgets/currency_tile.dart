import 'package:billionaire/core/enum/currency_enum.dart';
import 'package:billionaire/src/presentation/shared/controllers/currency_provider.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrencyTile extends ConsumerWidget {
  const CurrencyTile({
    required this.currency,
    super.key,
  });

  final Currency currency;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 14,
      ),
      leading: SvgPicture.asset(currency.iconPath),
      title: BillionText.bodyLarge(
        '${currency.fullName}  ${currency.char}',
      ),
      onTap: () {
        ref
            .read(currencyProviderProvider.notifier)
            .setCurrency(currency);
        GoRouter.of(context).pop();
      },
    );
  }
}
