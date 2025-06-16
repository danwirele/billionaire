// enum CurrencyEnum { ruble, usaDollar, euro }
enum Currency {
  ruble(name: '₽'),
  usDollar(name: '\$'),
  euro(name: '€');

  final String name;
  const Currency({required this.name});
}
