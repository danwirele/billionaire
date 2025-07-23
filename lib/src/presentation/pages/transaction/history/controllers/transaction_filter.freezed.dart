// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionFilterStateModel {

 FilterOption get filterOption; String get filterName;
/// Create a copy of TransactionFilterStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionFilterStateModelCopyWith<TransactionFilterStateModel> get copyWith => _$TransactionFilterStateModelCopyWithImpl<TransactionFilterStateModel>(this as TransactionFilterStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionFilterStateModel&&(identical(other.filterOption, filterOption) || other.filterOption == filterOption)&&(identical(other.filterName, filterName) || other.filterName == filterName));
}


@override
int get hashCode => Object.hash(runtimeType,filterOption,filterName);

@override
String toString() {
  return 'TransactionFilterStateModel(filterOption: $filterOption, filterName: $filterName)';
}


}

/// @nodoc
abstract mixin class $TransactionFilterStateModelCopyWith<$Res>  {
  factory $TransactionFilterStateModelCopyWith(TransactionFilterStateModel value, $Res Function(TransactionFilterStateModel) _then) = _$TransactionFilterStateModelCopyWithImpl;
@useResult
$Res call({
 FilterOption filterOption, String filterName
});




}
/// @nodoc
class _$TransactionFilterStateModelCopyWithImpl<$Res>
    implements $TransactionFilterStateModelCopyWith<$Res> {
  _$TransactionFilterStateModelCopyWithImpl(this._self, this._then);

  final TransactionFilterStateModel _self;
  final $Res Function(TransactionFilterStateModel) _then;

/// Create a copy of TransactionFilterStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filterOption = null,Object? filterName = null,}) {
  return _then(_self.copyWith(
filterOption: null == filterOption ? _self.filterOption : filterOption // ignore: cast_nullable_to_non_nullable
as FilterOption,filterName: null == filterName ? _self.filterName : filterName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionFilterStateModel].
extension TransactionFilterStateModelPatterns on TransactionFilterStateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionFilterStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionFilterStateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionFilterStateModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionFilterStateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionFilterStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionFilterStateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FilterOption filterOption,  String filterName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionFilterStateModel() when $default != null:
return $default(_that.filterOption,_that.filterName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FilterOption filterOption,  String filterName)  $default,) {final _that = this;
switch (_that) {
case _TransactionFilterStateModel():
return $default(_that.filterOption,_that.filterName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FilterOption filterOption,  String filterName)?  $default,) {final _that = this;
switch (_that) {
case _TransactionFilterStateModel() when $default != null:
return $default(_that.filterOption,_that.filterName);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionFilterStateModel implements TransactionFilterStateModel {
  const _TransactionFilterStateModel({required this.filterOption, required this.filterName});
  

@override final  FilterOption filterOption;
@override final  String filterName;

/// Create a copy of TransactionFilterStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionFilterStateModelCopyWith<_TransactionFilterStateModel> get copyWith => __$TransactionFilterStateModelCopyWithImpl<_TransactionFilterStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionFilterStateModel&&(identical(other.filterOption, filterOption) || other.filterOption == filterOption)&&(identical(other.filterName, filterName) || other.filterName == filterName));
}


@override
int get hashCode => Object.hash(runtimeType,filterOption,filterName);

@override
String toString() {
  return 'TransactionFilterStateModel(filterOption: $filterOption, filterName: $filterName)';
}


}

/// @nodoc
abstract mixin class _$TransactionFilterStateModelCopyWith<$Res> implements $TransactionFilterStateModelCopyWith<$Res> {
  factory _$TransactionFilterStateModelCopyWith(_TransactionFilterStateModel value, $Res Function(_TransactionFilterStateModel) _then) = __$TransactionFilterStateModelCopyWithImpl;
@override @useResult
$Res call({
 FilterOption filterOption, String filterName
});




}
/// @nodoc
class __$TransactionFilterStateModelCopyWithImpl<$Res>
    implements _$TransactionFilterStateModelCopyWith<$Res> {
  __$TransactionFilterStateModelCopyWithImpl(this._self, this._then);

  final _TransactionFilterStateModel _self;
  final $Res Function(_TransactionFilterStateModel) _then;

/// Create a copy of TransactionFilterStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filterOption = null,Object? filterName = null,}) {
  return _then(_TransactionFilterStateModel(
filterOption: null == filterOption ? _self.filterOption : filterOption // ignore: cast_nullable_to_non_nullable
as FilterOption,filterName: null == filterName ? _self.filterName : filterName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
