import 'package:billionaire/core/enum/filter_option.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'transaction_filter.g.dart';
part 'transaction_filter.freezed.dart';

@riverpod
class TransactionFilter extends _$TransactionFilter {
  @override
  TransactionFilterStateModel? build() {
    return null;
  }

  void setTransactionFilter(FilterOption newFilter, String filterName) {
    state = TransactionFilterStateModel(filterOption: newFilter, filterName: filterName);
  }
}

@freezed
abstract class TransactionFilterStateModel with _$TransactionFilterStateModel {
  const factory TransactionFilterStateModel({
    required FilterOption filterOption,
    required String filterName,
  }) = _TransactionFilterStateModel;
}
