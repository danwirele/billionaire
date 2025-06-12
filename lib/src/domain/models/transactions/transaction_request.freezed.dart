// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionRequestModel {

 int get accountId; int get categoryId; String get amount; DateTime get transactionDate; String? get comment;
/// Create a copy of TransactionRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionRequestModelCopyWith<TransactionRequestModel> get copyWith => _$TransactionRequestModelCopyWithImpl<TransactionRequestModel>(this as TransactionRequestModel, _$identity);

  /// Serializes this TransactionRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionRequestModel&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,categoryId,amount,transactionDate,comment);

@override
String toString() {
  return 'TransactionRequestModel(accountId: $accountId, categoryId: $categoryId, amount: $amount, transactionDate: $transactionDate, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $TransactionRequestModelCopyWith<$Res>  {
  factory $TransactionRequestModelCopyWith(TransactionRequestModel value, $Res Function(TransactionRequestModel) _then) = _$TransactionRequestModelCopyWithImpl;
@useResult
$Res call({
 int accountId, int categoryId, String amount, DateTime transactionDate, String? comment
});




}
/// @nodoc
class _$TransactionRequestModelCopyWithImpl<$Res>
    implements $TransactionRequestModelCopyWith<$Res> {
  _$TransactionRequestModelCopyWithImpl(this._self, this._then);

  final TransactionRequestModel _self;
  final $Res Function(TransactionRequestModel) _then;

/// Create a copy of TransactionRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? categoryId = null,Object? amount = null,Object? transactionDate = null,Object? comment = freezed,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TransactionRequestModel implements TransactionRequestModel {
  const _TransactionRequestModel({required this.accountId, required this.categoryId, required this.amount, required this.transactionDate, this.comment});
  factory _TransactionRequestModel.fromJson(Map<String, dynamic> json) => _$TransactionRequestModelFromJson(json);

@override final  int accountId;
@override final  int categoryId;
@override final  String amount;
@override final  DateTime transactionDate;
@override final  String? comment;

/// Create a copy of TransactionRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionRequestModelCopyWith<_TransactionRequestModel> get copyWith => __$TransactionRequestModelCopyWithImpl<_TransactionRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionRequestModel&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,categoryId,amount,transactionDate,comment);

@override
String toString() {
  return 'TransactionRequestModel(accountId: $accountId, categoryId: $categoryId, amount: $amount, transactionDate: $transactionDate, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$TransactionRequestModelCopyWith<$Res> implements $TransactionRequestModelCopyWith<$Res> {
  factory _$TransactionRequestModelCopyWith(_TransactionRequestModel value, $Res Function(_TransactionRequestModel) _then) = __$TransactionRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int accountId, int categoryId, String amount, DateTime transactionDate, String? comment
});




}
/// @nodoc
class __$TransactionRequestModelCopyWithImpl<$Res>
    implements _$TransactionRequestModelCopyWith<$Res> {
  __$TransactionRequestModelCopyWithImpl(this._self, this._then);

  final _TransactionRequestModel _self;
  final $Res Function(_TransactionRequestModel) _then;

/// Create a copy of TransactionRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? categoryId = null,Object? amount = null,Object? transactionDate = null,Object? comment = freezed,}) {
  return _then(_TransactionRequestModel(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
