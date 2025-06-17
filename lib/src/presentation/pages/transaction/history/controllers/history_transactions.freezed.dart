// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_transactions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryTransactionStateModel {

 List<TransactionResponseModel> get transactions; double get amount; ValueNotifier<DateTime> get startDateNotifier; ValueNotifier<DateTime> get endDateNotifier;
/// Create a copy of HistoryTransactionStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryTransactionStateModelCopyWith<HistoryTransactionStateModel> get copyWith => _$HistoryTransactionStateModelCopyWithImpl<HistoryTransactionStateModel>(this as HistoryTransactionStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryTransactionStateModel&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.startDateNotifier, startDateNotifier) || other.startDateNotifier == startDateNotifier)&&(identical(other.endDateNotifier, endDateNotifier) || other.endDateNotifier == endDateNotifier));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(transactions),amount,startDateNotifier,endDateNotifier);

@override
String toString() {
  return 'HistoryTransactionStateModel(transactions: $transactions, amount: $amount, startDateNotifier: $startDateNotifier, endDateNotifier: $endDateNotifier)';
}


}

/// @nodoc
abstract mixin class $HistoryTransactionStateModelCopyWith<$Res>  {
  factory $HistoryTransactionStateModelCopyWith(HistoryTransactionStateModel value, $Res Function(HistoryTransactionStateModel) _then) = _$HistoryTransactionStateModelCopyWithImpl;
@useResult
$Res call({
 List<TransactionResponseModel> transactions, double amount, ValueNotifier<DateTime> startDateNotifier, ValueNotifier<DateTime> endDateNotifier
});




}
/// @nodoc
class _$HistoryTransactionStateModelCopyWithImpl<$Res>
    implements $HistoryTransactionStateModelCopyWith<$Res> {
  _$HistoryTransactionStateModelCopyWithImpl(this._self, this._then);

  final HistoryTransactionStateModel _self;
  final $Res Function(HistoryTransactionStateModel) _then;

/// Create a copy of HistoryTransactionStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactions = null,Object? amount = null,Object? startDateNotifier = null,Object? endDateNotifier = null,}) {
  return _then(_self.copyWith(
transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionResponseModel>,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,startDateNotifier: null == startDateNotifier ? _self.startDateNotifier : startDateNotifier // ignore: cast_nullable_to_non_nullable
as ValueNotifier<DateTime>,endDateNotifier: null == endDateNotifier ? _self.endDateNotifier : endDateNotifier // ignore: cast_nullable_to_non_nullable
as ValueNotifier<DateTime>,
  ));
}

}


/// @nodoc


class _HistoryTransactionStateModel implements HistoryTransactionStateModel {
  const _HistoryTransactionStateModel({required final  List<TransactionResponseModel> transactions, required this.amount, required this.startDateNotifier, required this.endDateNotifier}): _transactions = transactions;
  

 final  List<TransactionResponseModel> _transactions;
@override List<TransactionResponseModel> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override final  double amount;
@override final  ValueNotifier<DateTime> startDateNotifier;
@override final  ValueNotifier<DateTime> endDateNotifier;

/// Create a copy of HistoryTransactionStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryTransactionStateModelCopyWith<_HistoryTransactionStateModel> get copyWith => __$HistoryTransactionStateModelCopyWithImpl<_HistoryTransactionStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryTransactionStateModel&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.startDateNotifier, startDateNotifier) || other.startDateNotifier == startDateNotifier)&&(identical(other.endDateNotifier, endDateNotifier) || other.endDateNotifier == endDateNotifier));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_transactions),amount,startDateNotifier,endDateNotifier);

@override
String toString() {
  return 'HistoryTransactionStateModel(transactions: $transactions, amount: $amount, startDateNotifier: $startDateNotifier, endDateNotifier: $endDateNotifier)';
}


}

/// @nodoc
abstract mixin class _$HistoryTransactionStateModelCopyWith<$Res> implements $HistoryTransactionStateModelCopyWith<$Res> {
  factory _$HistoryTransactionStateModelCopyWith(_HistoryTransactionStateModel value, $Res Function(_HistoryTransactionStateModel) _then) = __$HistoryTransactionStateModelCopyWithImpl;
@override @useResult
$Res call({
 List<TransactionResponseModel> transactions, double amount, ValueNotifier<DateTime> startDateNotifier, ValueNotifier<DateTime> endDateNotifier
});




}
/// @nodoc
class __$HistoryTransactionStateModelCopyWithImpl<$Res>
    implements _$HistoryTransactionStateModelCopyWith<$Res> {
  __$HistoryTransactionStateModelCopyWithImpl(this._self, this._then);

  final _HistoryTransactionStateModel _self;
  final $Res Function(_HistoryTransactionStateModel) _then;

/// Create a copy of HistoryTransactionStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactions = null,Object? amount = null,Object? startDateNotifier = null,Object? endDateNotifier = null,}) {
  return _then(_HistoryTransactionStateModel(
transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionResponseModel>,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,startDateNotifier: null == startDateNotifier ? _self.startDateNotifier : startDateNotifier // ignore: cast_nullable_to_non_nullable
as ValueNotifier<DateTime>,endDateNotifier: null == endDateNotifier ? _self.endDateNotifier : endDateNotifier // ignore: cast_nullable_to_non_nullable
as ValueNotifier<DateTime>,
  ));
}


}

// dart format on
