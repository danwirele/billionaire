import 'package:billionaire/core/enum/currency_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'currency_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrencyProvider extends _$CurrencyProvider {
  @override
  Currency build() {
    return Currency.ruble;
  }

  void setCurrency(Currency currency) {
    state = currency;
  }
}
