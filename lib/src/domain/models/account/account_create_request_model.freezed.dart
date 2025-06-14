// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_create_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AccountCreateRequestModel _$AccountCreateRequestModelFromJson(
  Map<String, dynamic> json
) {
    return _AccountCreateRequest.fromJson(
      json
    );
}

/// @nodoc
mixin _$AccountCreateRequestModel {

 String get name; String get balance; String get currency;
/// Create a copy of AccountCreateRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCreateRequestModelCopyWith<AccountCreateRequestModel> get copyWith => _$AccountCreateRequestModelCopyWithImpl<AccountCreateRequestModel>(this as AccountCreateRequestModel, _$identity);

  /// Serializes this AccountCreateRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountCreateRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance,currency);

@override
String toString() {
  return 'AccountCreateRequestModel(name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $AccountCreateRequestModelCopyWith<$Res>  {
  factory $AccountCreateRequestModelCopyWith(AccountCreateRequestModel value, $Res Function(AccountCreateRequestModel) _then) = _$AccountCreateRequestModelCopyWithImpl;
@useResult
$Res call({
 String name, String balance, String currency
});




}
/// @nodoc
class _$AccountCreateRequestModelCopyWithImpl<$Res>
    implements $AccountCreateRequestModelCopyWith<$Res> {
  _$AccountCreateRequestModelCopyWithImpl(this._self, this._then);

  final AccountCreateRequestModel _self;
  final $Res Function(AccountCreateRequestModel) _then;

/// Create a copy of AccountCreateRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccountCreateRequest implements AccountCreateRequestModel {
  const _AccountCreateRequest({required this.name, required this.balance, required this.currency});
  factory _AccountCreateRequest.fromJson(Map<String, dynamic> json) => _$AccountCreateRequestFromJson(json);

@override final  String name;
@override final  String balance;
@override final  String currency;

/// Create a copy of AccountCreateRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountCreateRequestCopyWith<_AccountCreateRequest> get copyWith => __$AccountCreateRequestCopyWithImpl<_AccountCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountCreateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance,currency);

@override
String toString() {
  return 'AccountCreateRequestModel(name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$AccountCreateRequestCopyWith<$Res> implements $AccountCreateRequestModelCopyWith<$Res> {
  factory _$AccountCreateRequestCopyWith(_AccountCreateRequest value, $Res Function(_AccountCreateRequest) _then) = __$AccountCreateRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String balance, String currency
});




}
/// @nodoc
class __$AccountCreateRequestCopyWithImpl<$Res>
    implements _$AccountCreateRequestCopyWith<$Res> {
  __$AccountCreateRequestCopyWithImpl(this._self, this._then);

  final _AccountCreateRequest _self;
  final $Res Function(_AccountCreateRequest) _then;

/// Create a copy of AccountCreateRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_AccountCreateRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
