import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'balance_visibility.g.dart';

//Контролирует состояние отображения баланса на странице счета
//False - баланс скрыт
//True - баланс открыт
@Riverpod(keepAlive: true)
class BalanceVisibility extends _$BalanceVisibility {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
    print(state);
  }
}
