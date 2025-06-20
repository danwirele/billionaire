import 'package:billionaire/core/enum/filter_option.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'transaction_filter.g.dart';

@riverpod
class TransactionFilter extends _$TransactionFilter {
  @override
  FilterOption? build() {
    return null;
  }

  void setTransactionFilter(FilterOption newFilter) {
    state = newFilter;
  }
}
