import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart' show BuildContext;

enum Currency {
  ruble(
    char: '₽',
    iconPath: 'assets/icons/mdi_ruble.svg',
  ),
  usDollar(
    char: r'$',
    iconPath: 'assets/icons/mdi_dollar.svg',
  ),
  euro(
    char: '€',
    iconPath: 'assets/icons/mdi_euro.svg',
  );

  const Currency({
    required this.char,
    required this.iconPath,
  });

  final String char;
  final String iconPath;
}

extension CurrencyLocalizedName on BuildContext {
  String localizedDisplayName(Currency currency) {
    switch (currency) {
      case Currency.ruble:
        return localization.russianRuble;
      case Currency.usDollar:
        return localization.dollar;
      case Currency.euro:
        return localization.euro;
    }
  }
}
