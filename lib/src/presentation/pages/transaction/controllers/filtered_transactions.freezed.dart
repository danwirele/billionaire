// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filtered_transactions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionStateModel {

 List<TransactionResponseModel> get transactions; double get amount;
/// Create a copy of TransactionStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionStateModelCopyWith<TransactionStateModel> get copyWith => _$TransactionStateModelCopyWithImpl<TransactionStateModel>(this as TransactionStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionStateModel&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(transactions),amount);

@override
String toString() {
  return 'TransactionStateModel(transactions: $transactions, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $TransactionStateModelCopyWith<$Res>  {
  factory $TransactionStateModelCopyWith(TransactionStateModel value, $Res Function(TransactionStateModel) _then) = _$TransactionStateModelCopyWithImpl;
@useResult
$Res call({
 List<TransactionResponseModel> transactions, double amount
});




}
/// @nodoc
class _$TransactionStateModelCopyWithImpl<$Res>
    implements $TransactionStateModelCopyWith<$Res> {
  _$TransactionStateModelCopyWithImpl(this._self, this._then);

  final TransactionStateModel _self;
  final $Res Function(TransactionStateModel) _then;

/// Create a copy of TransactionStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactions = null,Object? amount = null,}) {
  return _then(_self.copyWith(
transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionResponseModel>,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc


class _TransactionStateModel implements TransactionStateModel {
  const _TransactionStateModel({required final  List<TransactionResponseModel> transactions, required this.amount}): _transactions = transactions;
  

 final  List<TransactionResponseModel> _transactions;
@override List<TransactionResponseModel> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override final  double amount;

/// Create a copy of TransactionStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionStateModelCopyWith<_TransactionStateModel> get copyWith => __$TransactionStateModelCopyWithImpl<_TransactionStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionStateModel&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_transactions),amount);

@override
String toString() {
  return 'TransactionStateModel(transactions: $transactions, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$TransactionStateModelCopyWith<$Res> implements $TransactionStateModelCopyWith<$Res> {
  factory _$TransactionStateModelCopyWith(_TransactionStateModel value, $Res Function(_TransactionStateModel) _then) = __$TransactionStateModelCopyWithImpl;
@override @useResult
$Res call({
 List<TransactionResponseModel> transactions, double amount
});




}
/// @nodoc
class __$TransactionStateModelCopyWithImpl<$Res>
    implements _$TransactionStateModelCopyWith<$Res> {
  __$TransactionStateModelCopyWithImpl(this._self, this._then);

  final _TransactionStateModel _self;
  final $Res Function(_TransactionStateModel) _then;

/// Create a copy of TransactionStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactions = null,Object? amount = null,}) {
  return _then(_TransactionStateModel(
transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionResponseModel>,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
