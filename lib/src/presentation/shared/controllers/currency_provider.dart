import 'package:billionaire/core/enum/currency_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'currency_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrencyProvider extends _$CurrencyProvider {
  static const Map<CurrencyEnum, String> currencyMap = {
    CurrencyEnum.usaDollar: '\$',
    CurrencyEnum.ruble: '₽',
    CurrencyEnum.euro: '€',
  };

  @override
  String build() {
    return currencyMap[CurrencyEnum.ruble]!;
  }

  void setCurrency(CurrencyEnum currency) {
    state = currencyMap[currency]!;
  }
}
