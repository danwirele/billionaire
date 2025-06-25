// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnalysisFilterStateModel {

 ValueNotifier<DateTime> get startDate; ValueNotifier<DateTime> get endDate;
/// Create a copy of AnalysisFilterStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalysisFilterStateModelCopyWith<AnalysisFilterStateModel> get copyWith => _$AnalysisFilterStateModelCopyWithImpl<AnalysisFilterStateModel>(this as AnalysisFilterStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalysisFilterStateModel&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate);

@override
String toString() {
  return 'AnalysisFilterStateModel(startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $AnalysisFilterStateModelCopyWith<$Res>  {
  factory $AnalysisFilterStateModelCopyWith(AnalysisFilterStateModel value, $Res Function(AnalysisFilterStateModel) _then) = _$AnalysisFilterStateModelCopyWithImpl;
@useResult
$Res call({
 ValueNotifier<DateTime> startDate, ValueNotifier<DateTime> endDate
});




}
/// @nodoc
class _$AnalysisFilterStateModelCopyWithImpl<$Res>
    implements $AnalysisFilterStateModelCopyWith<$Res> {
  _$AnalysisFilterStateModelCopyWithImpl(this._self, this._then);

  final AnalysisFilterStateModel _self;
  final $Res Function(AnalysisFilterStateModel) _then;

/// Create a copy of AnalysisFilterStateModel
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


class _AnalysisFilterStateModel implements AnalysisFilterStateModel {
  const _AnalysisFilterStateModel({required this.startDate, required this.endDate});
  

@override final  ValueNotifier<DateTime> startDate;
@override final  ValueNotifier<DateTime> endDate;

/// Create a copy of AnalysisFilterStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalysisFilterStateModelCopyWith<_AnalysisFilterStateModel> get copyWith => __$AnalysisFilterStateModelCopyWithImpl<_AnalysisFilterStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalysisFilterStateModel&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate);

@override
String toString() {
  return 'AnalysisFilterStateModel(startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$AnalysisFilterStateModelCopyWith<$Res> implements $AnalysisFilterStateModelCopyWith<$Res> {
  factory _$AnalysisFilterStateModelCopyWith(_AnalysisFilterStateModel value, $Res Function(_AnalysisFilterStateModel) _then) = __$AnalysisFilterStateModelCopyWithImpl;
@override @useResult
$Res call({
 ValueNotifier<DateTime> startDate, ValueNotifier<DateTime> endDate
});




}
/// @nodoc
class __$AnalysisFilterStateModelCopyWithImpl<$Res>
    implements _$AnalysisFilterStateModelCopyWith<$Res> {
  __$AnalysisFilterStateModelCopyWithImpl(this._self, this._then);

  final _AnalysisFilterStateModel _self;
  final $Res Function(_AnalysisFilterStateModel) _then;

/// Create a copy of AnalysisFilterStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = null,}) {
  return _then(_AnalysisFilterStateModel(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as ValueNotifier<DateTime>,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as ValueNotifier<DateTime>,
  ));
}


}

// dart format on
