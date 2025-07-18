// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeState {

 ThemeMode get mode; Color? get lightTintColor; Color? get darkTintColor;
/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeStateCopyWith<ThemeState> get copyWith => _$ThemeStateCopyWithImpl<ThemeState>(this as ThemeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.lightTintColor, lightTintColor) || other.lightTintColor == lightTintColor)&&(identical(other.darkTintColor, darkTintColor) || other.darkTintColor == darkTintColor));
}


@override
int get hashCode => Object.hash(runtimeType,mode,lightTintColor,darkTintColor);

@override
String toString() {
  return 'ThemeState(mode: $mode, lightTintColor: $lightTintColor, darkTintColor: $darkTintColor)';
}


}

/// @nodoc
abstract mixin class $ThemeStateCopyWith<$Res>  {
  factory $ThemeStateCopyWith(ThemeState value, $Res Function(ThemeState) _then) = _$ThemeStateCopyWithImpl;
@useResult
$Res call({
 ThemeMode mode, Color? lightTintColor, Color? darkTintColor
});




}
/// @nodoc
class _$ThemeStateCopyWithImpl<$Res>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._self, this._then);

  final ThemeState _self;
  final $Res Function(ThemeState) _then;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? lightTintColor = freezed,Object? darkTintColor = freezed,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ThemeMode,lightTintColor: freezed == lightTintColor ? _self.lightTintColor : lightTintColor // ignore: cast_nullable_to_non_nullable
as Color?,darkTintColor: freezed == darkTintColor ? _self.darkTintColor : darkTintColor // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeState].
extension ThemeStatePatterns on ThemeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeState value)  $default,){
final _that = this;
switch (_that) {
case _ThemeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeState value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode mode,  Color? lightTintColor,  Color? darkTintColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeState() when $default != null:
return $default(_that.mode,_that.lightTintColor,_that.darkTintColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode mode,  Color? lightTintColor,  Color? darkTintColor)  $default,) {final _that = this;
switch (_that) {
case _ThemeState():
return $default(_that.mode,_that.lightTintColor,_that.darkTintColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode mode,  Color? lightTintColor,  Color? darkTintColor)?  $default,) {final _that = this;
switch (_that) {
case _ThemeState() when $default != null:
return $default(_that.mode,_that.lightTintColor,_that.darkTintColor);case _:
  return null;

}
}

}

/// @nodoc


class _ThemeState implements ThemeState {
   _ThemeState({required this.mode, this.lightTintColor, this.darkTintColor});
  

@override final  ThemeMode mode;
@override final  Color? lightTintColor;
@override final  Color? darkTintColor;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeStateCopyWith<_ThemeState> get copyWith => __$ThemeStateCopyWithImpl<_ThemeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.lightTintColor, lightTintColor) || other.lightTintColor == lightTintColor)&&(identical(other.darkTintColor, darkTintColor) || other.darkTintColor == darkTintColor));
}


@override
int get hashCode => Object.hash(runtimeType,mode,lightTintColor,darkTintColor);

@override
String toString() {
  return 'ThemeState(mode: $mode, lightTintColor: $lightTintColor, darkTintColor: $darkTintColor)';
}


}

/// @nodoc
abstract mixin class _$ThemeStateCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory _$ThemeStateCopyWith(_ThemeState value, $Res Function(_ThemeState) _then) = __$ThemeStateCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode mode, Color? lightTintColor, Color? darkTintColor
});




}
/// @nodoc
class __$ThemeStateCopyWithImpl<$Res>
    implements _$ThemeStateCopyWith<$Res> {
  __$ThemeStateCopyWithImpl(this._self, this._then);

  final _ThemeState _self;
  final $Res Function(_ThemeState) _then;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? lightTintColor = freezed,Object? darkTintColor = freezed,}) {
  return _then(_ThemeState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ThemeMode,lightTintColor: freezed == lightTintColor ? _self.lightTintColor : lightTintColor // ignore: cast_nullable_to_non_nullable
as Color?,darkTintColor: freezed == darkTintColor ? _self.darkTintColor : darkTintColor // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}


}

// dart format on
