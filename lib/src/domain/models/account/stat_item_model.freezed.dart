// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stat_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatItemModel {

 int get categoryId; String get categoryName; String get emoji; String get amount;
/// Create a copy of StatItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatItemModelCopyWith<StatItemModel> get copyWith => _$StatItemModelCopyWithImpl<StatItemModel>(this as StatItemModel, _$identity);

  /// Serializes this StatItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatItemModel&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,emoji,amount);

@override
String toString() {
  return 'StatItemModel(categoryId: $categoryId, categoryName: $categoryName, emoji: $emoji, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $StatItemModelCopyWith<$Res>  {
  factory $StatItemModelCopyWith(StatItemModel value, $Res Function(StatItemModel) _then) = _$StatItemModelCopyWithImpl;
@useResult
$Res call({
 int categoryId, String categoryName, String emoji, String amount
});




}
/// @nodoc
class _$StatItemModelCopyWithImpl<$Res>
    implements $StatItemModelCopyWith<$Res> {
  _$StatItemModelCopyWithImpl(this._self, this._then);

  final StatItemModel _self;
  final $Res Function(StatItemModel) _then;

/// Create a copy of StatItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? categoryName = null,Object? emoji = null,Object? amount = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _StatItemModel implements StatItemModel {
  const _StatItemModel({required this.categoryId, required this.categoryName, required this.emoji, required this.amount});
  factory _StatItemModel.fromJson(Map<String, dynamic> json) => _$StatItemModelFromJson(json);

@override final  int categoryId;
@override final  String categoryName;
@override final  String emoji;
@override final  String amount;

/// Create a copy of StatItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatItemModelCopyWith<_StatItemModel> get copyWith => __$StatItemModelCopyWithImpl<_StatItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatItemModel&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,emoji,amount);

@override
String toString() {
  return 'StatItemModel(categoryId: $categoryId, categoryName: $categoryName, emoji: $emoji, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$StatItemModelCopyWith<$Res> implements $StatItemModelCopyWith<$Res> {
  factory _$StatItemModelCopyWith(_StatItemModel value, $Res Function(_StatItemModel) _then) = __$StatItemModelCopyWithImpl;
@override @useResult
$Res call({
 int categoryId, String categoryName, String emoji, String amount
});




}
/// @nodoc
class __$StatItemModelCopyWithImpl<$Res>
    implements _$StatItemModelCopyWith<$Res> {
  __$StatItemModelCopyWithImpl(this._self, this._then);

  final _StatItemModel _self;
  final $Res Function(_StatItemModel) _then;

/// Create a copy of StatItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? categoryName = null,Object? emoji = null,Object? amount = null,}) {
  return _then(_StatItemModel(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
