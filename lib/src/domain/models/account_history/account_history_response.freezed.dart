// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountHistoryResponseModel {

 int get accountId; String get accountName; String get currency; String get currentBalance; List<AccountHistoryModel> get history;
/// Create a copy of AccountHistoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountHistoryResponseModelCopyWith<AccountHistoryResponseModel> get copyWith => _$AccountHistoryResponseModelCopyWithImpl<AccountHistoryResponseModel>(this as AccountHistoryResponseModel, _$identity);

  /// Serializes this AccountHistoryResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountHistoryResponseModel&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&const DeepCollectionEquality().equals(other.history, history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountName,currency,currentBalance,const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'AccountHistoryResponseModel(accountId: $accountId, accountName: $accountName, currency: $currency, currentBalance: $currentBalance, history: $history)';
}


}

/// @nodoc
abstract mixin class $AccountHistoryResponseModelCopyWith<$Res>  {
  factory $AccountHistoryResponseModelCopyWith(AccountHistoryResponseModel value, $Res Function(AccountHistoryResponseModel) _then) = _$AccountHistoryResponseModelCopyWithImpl;
@useResult
$Res call({
 int accountId, String accountName, String currency, String currentBalance, List<AccountHistoryModel> history
});




}
/// @nodoc
class _$AccountHistoryResponseModelCopyWithImpl<$Res>
    implements $AccountHistoryResponseModelCopyWith<$Res> {
  _$AccountHistoryResponseModelCopyWithImpl(this._self, this._then);

  final AccountHistoryResponseModel _self;
  final $Res Function(AccountHistoryResponseModel) _then;

/// Create a copy of AccountHistoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? accountName = null,Object? currency = null,Object? currentBalance = null,Object? history = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,currentBalance: null == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as String,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<AccountHistoryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountHistoryResponseModel].
extension AccountHistoryResponseModelPatterns on AccountHistoryResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountHistoryResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountHistoryResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountHistoryResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AccountHistoryResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountHistoryResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AccountHistoryResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int accountId,  String accountName,  String currency,  String currentBalance,  List<AccountHistoryModel> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountHistoryResponseModel() when $default != null:
return $default(_that.accountId,_that.accountName,_that.currency,_that.currentBalance,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int accountId,  String accountName,  String currency,  String currentBalance,  List<AccountHistoryModel> history)  $default,) {final _that = this;
switch (_that) {
case _AccountHistoryResponseModel():
return $default(_that.accountId,_that.accountName,_that.currency,_that.currentBalance,_that.history);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int accountId,  String accountName,  String currency,  String currentBalance,  List<AccountHistoryModel> history)?  $default,) {final _that = this;
switch (_that) {
case _AccountHistoryResponseModel() when $default != null:
return $default(_that.accountId,_that.accountName,_that.currency,_that.currentBalance,_that.history);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountHistoryResponseModel implements AccountHistoryResponseModel {
  const _AccountHistoryResponseModel({required this.accountId, required this.accountName, required this.currency, required this.currentBalance, required final  List<AccountHistoryModel> history}): _history = history;
  factory _AccountHistoryResponseModel.fromJson(Map<String, dynamic> json) => _$AccountHistoryResponseModelFromJson(json);

@override final  int accountId;
@override final  String accountName;
@override final  String currency;
@override final  String currentBalance;
 final  List<AccountHistoryModel> _history;
@override List<AccountHistoryModel> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of AccountHistoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountHistoryResponseModelCopyWith<_AccountHistoryResponseModel> get copyWith => __$AccountHistoryResponseModelCopyWithImpl<_AccountHistoryResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountHistoryResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountHistoryResponseModel&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&const DeepCollectionEquality().equals(other._history, _history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountName,currency,currentBalance,const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'AccountHistoryResponseModel(accountId: $accountId, accountName: $accountName, currency: $currency, currentBalance: $currentBalance, history: $history)';
}


}

/// @nodoc
abstract mixin class _$AccountHistoryResponseModelCopyWith<$Res> implements $AccountHistoryResponseModelCopyWith<$Res> {
  factory _$AccountHistoryResponseModelCopyWith(_AccountHistoryResponseModel value, $Res Function(_AccountHistoryResponseModel) _then) = __$AccountHistoryResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int accountId, String accountName, String currency, String currentBalance, List<AccountHistoryModel> history
});




}
/// @nodoc
class __$AccountHistoryResponseModelCopyWithImpl<$Res>
    implements _$AccountHistoryResponseModelCopyWith<$Res> {
  __$AccountHistoryResponseModelCopyWithImpl(this._self, this._then);

  final _AccountHistoryResponseModel _self;
  final $Res Function(_AccountHistoryResponseModel) _then;

/// Create a copy of AccountHistoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? accountName = null,Object? currency = null,Object? currentBalance = null,Object? history = null,}) {
  return _then(_AccountHistoryResponseModel(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,currentBalance: null == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as String,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<AccountHistoryModel>,
  ));
}


}

// dart format on
