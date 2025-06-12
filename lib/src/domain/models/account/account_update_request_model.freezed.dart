// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_update_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountUpdateRequestModel {

 String? get name; String? get balance; String? get currency;
/// Create a copy of AccountUpdateRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountUpdateRequestModelCopyWith<AccountUpdateRequestModel> get copyWith => _$AccountUpdateRequestModelCopyWithImpl<AccountUpdateRequestModel>(this as AccountUpdateRequestModel, _$identity);

  /// Serializes this AccountUpdateRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountUpdateRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance,currency);

@override
String toString() {
  return 'AccountUpdateRequestModel(name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $AccountUpdateRequestModelCopyWith<$Res>  {
  factory $AccountUpdateRequestModelCopyWith(AccountUpdateRequestModel value, $Res Function(AccountUpdateRequestModel) _then) = _$AccountUpdateRequestModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? balance, String? currency
});




}
/// @nodoc
class _$AccountUpdateRequestModelCopyWithImpl<$Res>
    implements $AccountUpdateRequestModelCopyWith<$Res> {
  _$AccountUpdateRequestModelCopyWithImpl(this._self, this._then);

  final AccountUpdateRequestModel _self;
  final $Res Function(AccountUpdateRequestModel) _then;

/// Create a copy of AccountUpdateRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? balance = freezed,Object? currency = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccountUpdateRequestModel implements AccountUpdateRequestModel {
  const _AccountUpdateRequestModel({this.name, this.balance, this.currency});
  factory _AccountUpdateRequestModel.fromJson(Map<String, dynamic> json) => _$AccountUpdateRequestModelFromJson(json);

@override final  String? name;
@override final  String? balance;
@override final  String? currency;

/// Create a copy of AccountUpdateRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountUpdateRequestModelCopyWith<_AccountUpdateRequestModel> get copyWith => __$AccountUpdateRequestModelCopyWithImpl<_AccountUpdateRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountUpdateRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountUpdateRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance,currency);

@override
String toString() {
  return 'AccountUpdateRequestModel(name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$AccountUpdateRequestModelCopyWith<$Res> implements $AccountUpdateRequestModelCopyWith<$Res> {
  factory _$AccountUpdateRequestModelCopyWith(_AccountUpdateRequestModel value, $Res Function(_AccountUpdateRequestModel) _then) = __$AccountUpdateRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? balance, String? currency
});




}
/// @nodoc
class __$AccountUpdateRequestModelCopyWithImpl<$Res>
    implements _$AccountUpdateRequestModelCopyWith<$Res> {
  __$AccountUpdateRequestModelCopyWithImpl(this._self, this._then);

  final _AccountUpdateRequestModel _self;
  final $Res Function(_AccountUpdateRequestModel) _then;

/// Create a copy of AccountUpdateRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? balance = freezed,Object? currency = freezed,}) {
  return _then(_AccountUpdateRequestModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
