// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountHistoryModel {

 int get id; int get accountId; String get changeType; AccountStateModel get previousState; AccountStateModel get newState; DateTime get changeTimestamp; DateTime get createdAt;
/// Create a copy of AccountHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountHistoryModelCopyWith<AccountHistoryModel> get copyWith => _$AccountHistoryModelCopyWithImpl<AccountHistoryModel>(this as AccountHistoryModel, _$identity);

  /// Serializes this AccountHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.changeType, changeType) || other.changeType == changeType)&&(identical(other.previousState, previousState) || other.previousState == previousState)&&(identical(other.newState, newState) || other.newState == newState)&&(identical(other.changeTimestamp, changeTimestamp) || other.changeTimestamp == changeTimestamp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,changeType,previousState,newState,changeTimestamp,createdAt);

@override
String toString() {
  return 'AccountHistoryModel(id: $id, accountId: $accountId, changeType: $changeType, previousState: $previousState, newState: $newState, changeTimestamp: $changeTimestamp, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AccountHistoryModelCopyWith<$Res>  {
  factory $AccountHistoryModelCopyWith(AccountHistoryModel value, $Res Function(AccountHistoryModel) _then) = _$AccountHistoryModelCopyWithImpl;
@useResult
$Res call({
 int id, int accountId, String changeType, AccountStateModel previousState, AccountStateModel newState, DateTime changeTimestamp, DateTime createdAt
});


$AccountStateModelCopyWith<$Res> get previousState;$AccountStateModelCopyWith<$Res> get newState;

}
/// @nodoc
class _$AccountHistoryModelCopyWithImpl<$Res>
    implements $AccountHistoryModelCopyWith<$Res> {
  _$AccountHistoryModelCopyWithImpl(this._self, this._then);

  final AccountHistoryModel _self;
  final $Res Function(AccountHistoryModel) _then;

/// Create a copy of AccountHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accountId = null,Object? changeType = null,Object? previousState = null,Object? newState = null,Object? changeTimestamp = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,changeType: null == changeType ? _self.changeType : changeType // ignore: cast_nullable_to_non_nullable
as String,previousState: null == previousState ? _self.previousState : previousState // ignore: cast_nullable_to_non_nullable
as AccountStateModel,newState: null == newState ? _self.newState : newState // ignore: cast_nullable_to_non_nullable
as AccountStateModel,changeTimestamp: null == changeTimestamp ? _self.changeTimestamp : changeTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of AccountHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountStateModelCopyWith<$Res> get previousState {
  
  return $AccountStateModelCopyWith<$Res>(_self.previousState, (value) {
    return _then(_self.copyWith(previousState: value));
  });
}/// Create a copy of AccountHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountStateModelCopyWith<$Res> get newState {
  
  return $AccountStateModelCopyWith<$Res>(_self.newState, (value) {
    return _then(_self.copyWith(newState: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountHistoryModel].
extension AccountHistoryModelPatterns on AccountHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _AccountHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _AccountHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int accountId,  String changeType,  AccountStateModel previousState,  AccountStateModel newState,  DateTime changeTimestamp,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountHistoryModel() when $default != null:
return $default(_that.id,_that.accountId,_that.changeType,_that.previousState,_that.newState,_that.changeTimestamp,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int accountId,  String changeType,  AccountStateModel previousState,  AccountStateModel newState,  DateTime changeTimestamp,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _AccountHistoryModel():
return $default(_that.id,_that.accountId,_that.changeType,_that.previousState,_that.newState,_that.changeTimestamp,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int accountId,  String changeType,  AccountStateModel previousState,  AccountStateModel newState,  DateTime changeTimestamp,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AccountHistoryModel() when $default != null:
return $default(_that.id,_that.accountId,_that.changeType,_that.previousState,_that.newState,_that.changeTimestamp,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountHistoryModel implements AccountHistoryModel {
  const _AccountHistoryModel({required this.id, required this.accountId, required this.changeType, required this.previousState, required this.newState, required this.changeTimestamp, required this.createdAt});
  factory _AccountHistoryModel.fromJson(Map<String, dynamic> json) => _$AccountHistoryModelFromJson(json);

@override final  int id;
@override final  int accountId;
@override final  String changeType;
@override final  AccountStateModel previousState;
@override final  AccountStateModel newState;
@override final  DateTime changeTimestamp;
@override final  DateTime createdAt;

/// Create a copy of AccountHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountHistoryModelCopyWith<_AccountHistoryModel> get copyWith => __$AccountHistoryModelCopyWithImpl<_AccountHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.changeType, changeType) || other.changeType == changeType)&&(identical(other.previousState, previousState) || other.previousState == previousState)&&(identical(other.newState, newState) || other.newState == newState)&&(identical(other.changeTimestamp, changeTimestamp) || other.changeTimestamp == changeTimestamp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,changeType,previousState,newState,changeTimestamp,createdAt);

@override
String toString() {
  return 'AccountHistoryModel(id: $id, accountId: $accountId, changeType: $changeType, previousState: $previousState, newState: $newState, changeTimestamp: $changeTimestamp, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AccountHistoryModelCopyWith<$Res> implements $AccountHistoryModelCopyWith<$Res> {
  factory _$AccountHistoryModelCopyWith(_AccountHistoryModel value, $Res Function(_AccountHistoryModel) _then) = __$AccountHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int accountId, String changeType, AccountStateModel previousState, AccountStateModel newState, DateTime changeTimestamp, DateTime createdAt
});


@override $AccountStateModelCopyWith<$Res> get previousState;@override $AccountStateModelCopyWith<$Res> get newState;

}
/// @nodoc
class __$AccountHistoryModelCopyWithImpl<$Res>
    implements _$AccountHistoryModelCopyWith<$Res> {
  __$AccountHistoryModelCopyWithImpl(this._self, this._then);

  final _AccountHistoryModel _self;
  final $Res Function(_AccountHistoryModel) _then;

/// Create a copy of AccountHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = null,Object? changeType = null,Object? previousState = null,Object? newState = null,Object? changeTimestamp = null,Object? createdAt = null,}) {
  return _then(_AccountHistoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,changeType: null == changeType ? _self.changeType : changeType // ignore: cast_nullable_to_non_nullable
as String,previousState: null == previousState ? _self.previousState : previousState // ignore: cast_nullable_to_non_nullable
as AccountStateModel,newState: null == newState ? _self.newState : newState // ignore: cast_nullable_to_non_nullable
as AccountStateModel,changeTimestamp: null == changeTimestamp ? _self.changeTimestamp : changeTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of AccountHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountStateModelCopyWith<$Res> get previousState {
  
  return $AccountStateModelCopyWith<$Res>(_self.previousState, (value) {
    return _then(_self.copyWith(previousState: value));
  });
}/// Create a copy of AccountHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountStateModelCopyWith<$Res> get newState {
  
  return $AccountStateModelCopyWith<$Res>(_self.newState, (value) {
    return _then(_self.copyWith(newState: value));
  });
}
}

// dart format on
