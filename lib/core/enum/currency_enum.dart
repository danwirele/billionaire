enum Currency {
  ruble(
    char: '₽',
    fullName: 'Российский рубль',
    iconPath: 'assets/icons/mdi_ruble.svg',
  ),
  usDollar(
    char: r'$',
    fullName: 'Американский доллар',
    iconPath: 'assets/icons/mdi_dollar.svg',
  ),
  euro(
    char: '€',
    fullName: 'Евро',
    iconPath: 'assets/icons/mdi_euro.svg',
  );

  const Currency({
    required this.char,
    required this.fullName,
    required this.iconPath,
  });

  final String char;
  final String fullName;
  final String iconPath;
}
