// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionResponseModel {

 int get id; AccountBriefModel get account; CategoryModel get category; String get amount;@DateTimeConverter() DateTime get transactionDate; DateTime get createdAt; DateTime get updatedAt; String? get comment;
/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionResponseModelCopyWith<TransactionResponseModel> get copyWith => _$TransactionResponseModelCopyWithImpl<TransactionResponseModel>(this as TransactionResponseModel, _$identity);

  /// Serializes this TransactionResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,account,category,amount,transactionDate,createdAt,updatedAt,comment);

@override
String toString() {
  return 'TransactionResponseModel(id: $id, account: $account, category: $category, amount: $amount, transactionDate: $transactionDate, createdAt: $createdAt, updatedAt: $updatedAt, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $TransactionResponseModelCopyWith<$Res>  {
  factory $TransactionResponseModelCopyWith(TransactionResponseModel value, $Res Function(TransactionResponseModel) _then) = _$TransactionResponseModelCopyWithImpl;
@useResult
$Res call({
 int id, AccountBriefModel account, CategoryModel category, String amount,@DateTimeConverter() DateTime transactionDate, DateTime createdAt, DateTime updatedAt, String? comment
});


$AccountBriefModelCopyWith<$Res> get account;$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$TransactionResponseModelCopyWithImpl<$Res>
    implements $TransactionResponseModelCopyWith<$Res> {
  _$TransactionResponseModelCopyWithImpl(this._self, this._then);

  final TransactionResponseModel _self;
  final $Res Function(TransactionResponseModel) _then;

/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? account = null,Object? category = null,Object? amount = null,Object? transactionDate = null,Object? createdAt = null,Object? updatedAt = null,Object? comment = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountBriefModel,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountBriefModelCopyWith<$Res> get account {
  
  return $AccountBriefModelCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionResponseModel].
extension TransactionResponseModelPatterns on TransactionResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  AccountBriefModel account,  CategoryModel category,  String amount, @DateTimeConverter()  DateTime transactionDate,  DateTime createdAt,  DateTime updatedAt,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionResponseModel() when $default != null:
return $default(_that.id,_that.account,_that.category,_that.amount,_that.transactionDate,_that.createdAt,_that.updatedAt,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  AccountBriefModel account,  CategoryModel category,  String amount, @DateTimeConverter()  DateTime transactionDate,  DateTime createdAt,  DateTime updatedAt,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _TransactionResponseModel():
return $default(_that.id,_that.account,_that.category,_that.amount,_that.transactionDate,_that.createdAt,_that.updatedAt,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  AccountBriefModel account,  CategoryModel category,  String amount, @DateTimeConverter()  DateTime transactionDate,  DateTime createdAt,  DateTime updatedAt,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _TransactionResponseModel() when $default != null:
return $default(_that.id,_that.account,_that.category,_that.amount,_that.transactionDate,_that.createdAt,_that.updatedAt,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionResponseModel implements TransactionResponseModel {
  const _TransactionResponseModel({required this.id, required this.account, required this.category, required this.amount, @DateTimeConverter() required this.transactionDate, required this.createdAt, required this.updatedAt, this.comment});
  factory _TransactionResponseModel.fromJson(Map<String, dynamic> json) => _$TransactionResponseModelFromJson(json);

@override final  int id;
@override final  AccountBriefModel account;
@override final  CategoryModel category;
@override final  String amount;
@override@DateTimeConverter() final  DateTime transactionDate;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? comment;

/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionResponseModelCopyWith<_TransactionResponseModel> get copyWith => __$TransactionResponseModelCopyWithImpl<_TransactionResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,account,category,amount,transactionDate,createdAt,updatedAt,comment);

@override
String toString() {
  return 'TransactionResponseModel(id: $id, account: $account, category: $category, amount: $amount, transactionDate: $transactionDate, createdAt: $createdAt, updatedAt: $updatedAt, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$TransactionResponseModelCopyWith<$Res> implements $TransactionResponseModelCopyWith<$Res> {
  factory _$TransactionResponseModelCopyWith(_TransactionResponseModel value, $Res Function(_TransactionResponseModel) _then) = __$TransactionResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int id, AccountBriefModel account, CategoryModel category, String amount,@DateTimeConverter() DateTime transactionDate, DateTime createdAt, DateTime updatedAt, String? comment
});


@override $AccountBriefModelCopyWith<$Res> get account;@override $CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$TransactionResponseModelCopyWithImpl<$Res>
    implements _$TransactionResponseModelCopyWith<$Res> {
  __$TransactionResponseModelCopyWithImpl(this._self, this._then);

  final _TransactionResponseModel _self;
  final $Res Function(_TransactionResponseModel) _then;

/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? account = null,Object? category = null,Object? amount = null,Object? transactionDate = null,Object? createdAt = null,Object? updatedAt = null,Object? comment = freezed,}) {
  return _then(_TransactionResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountBriefModel,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountBriefModelCopyWith<$Res> get account {
  
  return $AccountBriefModelCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of TransactionResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
