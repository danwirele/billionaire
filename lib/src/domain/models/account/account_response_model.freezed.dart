// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountResponseModel {

 int get id; String get name; String get balance; String get currency; List<StatItemModel> get incomeStats; List<StatItemModel> get expenseStats; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of AccountResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountResponseModelCopyWith<AccountResponseModel> get copyWith => _$AccountResponseModelCopyWithImpl<AccountResponseModel>(this as AccountResponseModel, _$identity);

  /// Serializes this AccountResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.incomeStats, incomeStats)&&const DeepCollectionEquality().equals(other.expenseStats, expenseStats)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency,const DeepCollectionEquality().hash(incomeStats),const DeepCollectionEquality().hash(expenseStats),createdAt,updatedAt);

@override
String toString() {
  return 'AccountResponseModel(id: $id, name: $name, balance: $balance, currency: $currency, incomeStats: $incomeStats, expenseStats: $expenseStats, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AccountResponseModelCopyWith<$Res>  {
  factory $AccountResponseModelCopyWith(AccountResponseModel value, $Res Function(AccountResponseModel) _then) = _$AccountResponseModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String balance, String currency, List<StatItemModel> incomeStats, List<StatItemModel> expenseStats, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$AccountResponseModelCopyWithImpl<$Res>
    implements $AccountResponseModelCopyWith<$Res> {
  _$AccountResponseModelCopyWithImpl(this._self, this._then);

  final AccountResponseModel _self;
  final $Res Function(AccountResponseModel) _then;

/// Create a copy of AccountResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,Object? incomeStats = null,Object? expenseStats = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,incomeStats: null == incomeStats ? _self.incomeStats : incomeStats // ignore: cast_nullable_to_non_nullable
as List<StatItemModel>,expenseStats: null == expenseStats ? _self.expenseStats : expenseStats // ignore: cast_nullable_to_non_nullable
as List<StatItemModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccountResponseModel implements AccountResponseModel {
  const _AccountResponseModel({required this.id, required this.name, required this.balance, required this.currency, required final  List<StatItemModel> incomeStats, required final  List<StatItemModel> expenseStats, required this.createdAt, required this.updatedAt}): _incomeStats = incomeStats,_expenseStats = expenseStats;
  factory _AccountResponseModel.fromJson(Map<String, dynamic> json) => _$AccountResponseModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String balance;
@override final  String currency;
 final  List<StatItemModel> _incomeStats;
@override List<StatItemModel> get incomeStats {
  if (_incomeStats is EqualUnmodifiableListView) return _incomeStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incomeStats);
}

 final  List<StatItemModel> _expenseStats;
@override List<StatItemModel> get expenseStats {
  if (_expenseStats is EqualUnmodifiableListView) return _expenseStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenseStats);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of AccountResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountResponseModelCopyWith<_AccountResponseModel> get copyWith => __$AccountResponseModelCopyWithImpl<_AccountResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._incomeStats, _incomeStats)&&const DeepCollectionEquality().equals(other._expenseStats, _expenseStats)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency,const DeepCollectionEquality().hash(_incomeStats),const DeepCollectionEquality().hash(_expenseStats),createdAt,updatedAt);

@override
String toString() {
  return 'AccountResponseModel(id: $id, name: $name, balance: $balance, currency: $currency, incomeStats: $incomeStats, expenseStats: $expenseStats, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AccountResponseModelCopyWith<$Res> implements $AccountResponseModelCopyWith<$Res> {
  factory _$AccountResponseModelCopyWith(_AccountResponseModel value, $Res Function(_AccountResponseModel) _then) = __$AccountResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String balance, String currency, List<StatItemModel> incomeStats, List<StatItemModel> expenseStats, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$AccountResponseModelCopyWithImpl<$Res>
    implements _$AccountResponseModelCopyWith<$Res> {
  __$AccountResponseModelCopyWithImpl(this._self, this._then);

  final _AccountResponseModel _self;
  final $Res Function(_AccountResponseModel) _then;

/// Create a copy of AccountResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,Object? incomeStats = null,Object? expenseStats = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_AccountResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,incomeStats: null == incomeStats ? _self._incomeStats : incomeStats // ignore: cast_nullable_to_non_nullable
as List<StatItemModel>,expenseStats: null == expenseStats ? _self._expenseStats : expenseStats // ignore: cast_nullable_to_non_nullable
as List<StatItemModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
