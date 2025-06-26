// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateAccountStateModel {

 AccountModel get account; TextEditingController get nameController;
/// Create a copy of UpdateAccountStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAccountStateModelCopyWith<UpdateAccountStateModel> get copyWith => _$UpdateAccountStateModelCopyWithImpl<UpdateAccountStateModel>(this as UpdateAccountStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAccountStateModel&&(identical(other.account, account) || other.account == account)&&(identical(other.nameController, nameController) || other.nameController == nameController));
}


@override
int get hashCode => Object.hash(runtimeType,account,nameController);

@override
String toString() {
  return 'UpdateAccountStateModel(account: $account, nameController: $nameController)';
}


}

/// @nodoc
abstract mixin class $UpdateAccountStateModelCopyWith<$Res>  {
  factory $UpdateAccountStateModelCopyWith(UpdateAccountStateModel value, $Res Function(UpdateAccountStateModel) _then) = _$UpdateAccountStateModelCopyWithImpl;
@useResult
$Res call({
 AccountModel account, TextEditingController nameController
});


$AccountModelCopyWith<$Res> get account;

}
/// @nodoc
class _$UpdateAccountStateModelCopyWithImpl<$Res>
    implements $UpdateAccountStateModelCopyWith<$Res> {
  _$UpdateAccountStateModelCopyWithImpl(this._self, this._then);

  final UpdateAccountStateModel _self;
  final $Res Function(UpdateAccountStateModel) _then;

/// Create a copy of UpdateAccountStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? account = null,Object? nameController = null,}) {
  return _then(_self.copyWith(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountModel,nameController: null == nameController ? _self.nameController : nameController // ignore: cast_nullable_to_non_nullable
as TextEditingController,
  ));
}
/// Create a copy of UpdateAccountStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountModelCopyWith<$Res> get account {
  
  return $AccountModelCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}


/// @nodoc


class _UpdateAccountStateModel implements UpdateAccountStateModel {
  const _UpdateAccountStateModel({required this.account, required this.nameController});
  

@override final  AccountModel account;
@override final  TextEditingController nameController;

/// Create a copy of UpdateAccountStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAccountStateModelCopyWith<_UpdateAccountStateModel> get copyWith => __$UpdateAccountStateModelCopyWithImpl<_UpdateAccountStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAccountStateModel&&(identical(other.account, account) || other.account == account)&&(identical(other.nameController, nameController) || other.nameController == nameController));
}


@override
int get hashCode => Object.hash(runtimeType,account,nameController);

@override
String toString() {
  return 'UpdateAccountStateModel(account: $account, nameController: $nameController)';
}


}

/// @nodoc
abstract mixin class _$UpdateAccountStateModelCopyWith<$Res> implements $UpdateAccountStateModelCopyWith<$Res> {
  factory _$UpdateAccountStateModelCopyWith(_UpdateAccountStateModel value, $Res Function(_UpdateAccountStateModel) _then) = __$UpdateAccountStateModelCopyWithImpl;
@override @useResult
$Res call({
 AccountModel account, TextEditingController nameController
});


@override $AccountModelCopyWith<$Res> get account;

}
/// @nodoc
class __$UpdateAccountStateModelCopyWithImpl<$Res>
    implements _$UpdateAccountStateModelCopyWith<$Res> {
  __$UpdateAccountStateModelCopyWithImpl(this._self, this._then);

  final _UpdateAccountStateModel _self;
  final $Res Function(_UpdateAccountStateModel) _then;

/// Create a copy of UpdateAccountStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? account = null,Object? nameController = null,}) {
  return _then(_UpdateAccountStateModel(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountModel,nameController: null == nameController ? _self.nameController : nameController // ignore: cast_nullable_to_non_nullable
as TextEditingController,
  ));
}

/// Create a copy of UpdateAccountStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountModelCopyWith<$Res> get account {
  
  return $AccountModelCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

// dart format on
