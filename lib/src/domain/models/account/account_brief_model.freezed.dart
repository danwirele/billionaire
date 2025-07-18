// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_brief_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountBriefModel {

 int get id; String get name; String get balance; String get currency;
/// Create a copy of AccountBriefModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountBriefModelCopyWith<AccountBriefModel> get copyWith => _$AccountBriefModelCopyWithImpl<AccountBriefModel>(this as AccountBriefModel, _$identity);

  /// Serializes this AccountBriefModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountBriefModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency);

@override
String toString() {
  return 'AccountBriefModel(id: $id, name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $AccountBriefModelCopyWith<$Res>  {
  factory $AccountBriefModelCopyWith(AccountBriefModel value, $Res Function(AccountBriefModel) _then) = _$AccountBriefModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String balance, String currency
});




}
/// @nodoc
class _$AccountBriefModelCopyWithImpl<$Res>
    implements $AccountBriefModelCopyWith<$Res> {
  _$AccountBriefModelCopyWithImpl(this._self, this._then);

  final AccountBriefModel _self;
  final $Res Function(AccountBriefModel) _then;

/// Create a copy of AccountBriefModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountBriefModel].
extension AccountBriefModelPatterns on AccountBriefModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountBriefModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountBriefModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountBriefModel value)  $default,){
final _that = this;
switch (_that) {
case _AccountBriefModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountBriefModel value)?  $default,){
final _that = this;
switch (_that) {
case _AccountBriefModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String balance,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountBriefModel() when $default != null:
return $default(_that.id,_that.name,_that.balance,_that.currency);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String balance,  String currency)  $default,) {final _that = this;
switch (_that) {
case _AccountBriefModel():
return $default(_that.id,_that.name,_that.balance,_that.currency);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String balance,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _AccountBriefModel() when $default != null:
return $default(_that.id,_that.name,_that.balance,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountBriefModel implements AccountBriefModel {
  const _AccountBriefModel({required this.id, required this.name, required this.balance, required this.currency});
  factory _AccountBriefModel.fromJson(Map<String, dynamic> json) => _$AccountBriefModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String balance;
@override final  String currency;

/// Create a copy of AccountBriefModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountBriefModelCopyWith<_AccountBriefModel> get copyWith => __$AccountBriefModelCopyWithImpl<_AccountBriefModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountBriefModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountBriefModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency);

@override
String toString() {
  return 'AccountBriefModel(id: $id, name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$AccountBriefModelCopyWith<$Res> implements $AccountBriefModelCopyWith<$Res> {
  factory _$AccountBriefModelCopyWith(_AccountBriefModel value, $Res Function(_AccountBriefModel) _then) = __$AccountBriefModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String balance, String currency
});




}
/// @nodoc
class __$AccountBriefModelCopyWithImpl<$Res>
    implements _$AccountBriefModelCopyWith<$Res> {
  __$AccountBriefModelCopyWithImpl(this._self, this._then);

  final _AccountBriefModel _self;
  final $Res Function(_AccountBriefModel) _then;

/// Create a copy of AccountBriefModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_AccountBriefModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
