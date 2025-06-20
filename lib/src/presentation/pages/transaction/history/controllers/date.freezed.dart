// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DateStateModel {

 ValueNotifier<DateTime> get startDate; ValueNotifier<DateTime> get endDate;
/// Create a copy of DateStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DateStateModelCopyWith<DateStateModel> get copyWith => _$DateStateModelCopyWithImpl<DateStateModel>(this as DateStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DateStateModel&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate);

@override
String toString() {
  return 'DateStateModel(startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $DateStateModelCopyWith<$Res>  {
  factory $DateStateModelCopyWith(DateStateModel value, $Res Function(DateStateModel) _then) = _$DateStateModelCopyWithImpl;
@useResult
$Res call({
 ValueNotifier<DateTime> startDate, ValueNotifier<DateTime> endDate
});




}
/// @nodoc
class _$DateStateModelCopyWithImpl<$Res>
    implements $DateStateModelCopyWith<$Res> {
  _$DateStateModelCopyWithImpl(this._self, this._then);

  final DateStateModel _self;
  final $Res Function(DateStateModel) _then;

/// Create a copy of DateStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as ValueNotifier<DateTime>,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as ValueNotifier<DateTime>,
  ));
}

}


/// @nodoc


class _DateStateModel implements DateStateModel {
  const _DateStateModel({required this.startDate, required this.endDate});
  

@override final  ValueNotifier<DateTime> startDate;
@override final  ValueNotifier<DateTime> endDate;

/// Create a copy of DateStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DateStateModelCopyWith<_DateStateModel> get copyWith => __$DateStateModelCopyWithImpl<_DateStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DateStateModel&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate);

@override
String toString() {
  return 'DateStateModel(startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$DateStateModelCopyWith<$Res> implements $DateStateModelCopyWith<$Res> {
  factory _$DateStateModelCopyWith(_DateStateModel value, $Res Function(_DateStateModel) _then) = __$DateStateModelCopyWithImpl;
@override @useResult
$Res call({
 ValueNotifier<DateTime> startDate, ValueNotifier<DateTime> endDate
});




}
/// @nodoc
class __$DateStateModelCopyWithImpl<$Res>
    implements _$DateStateModelCopyWith<$Res> {
  __$DateStateModelCopyWithImpl(this._self, this._then);

  final _DateStateModel _self;
  final $Res Function(_DateStateModel) _then;

/// Create a copy of DateStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = null,}) {
  return _then(_DateStateModel(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as ValueNotifier<DateTime>,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as ValueNotifier<DateTime>,
  ));
}


}

// dart format on
