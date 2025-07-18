// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnalyticsPageStateModel {

 List<AnalyticsStateModel> get stateModelsList; double get summaryAmount;
/// Create a copy of AnalyticsPageStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsPageStateModelCopyWith<AnalyticsPageStateModel> get copyWith => _$AnalyticsPageStateModelCopyWithImpl<AnalyticsPageStateModel>(this as AnalyticsPageStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsPageStateModel&&const DeepCollectionEquality().equals(other.stateModelsList, stateModelsList)&&(identical(other.summaryAmount, summaryAmount) || other.summaryAmount == summaryAmount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(stateModelsList),summaryAmount);

@override
String toString() {
  return 'AnalyticsPageStateModel(stateModelsList: $stateModelsList, summaryAmount: $summaryAmount)';
}


}

/// @nodoc
abstract mixin class $AnalyticsPageStateModelCopyWith<$Res>  {
  factory $AnalyticsPageStateModelCopyWith(AnalyticsPageStateModel value, $Res Function(AnalyticsPageStateModel) _then) = _$AnalyticsPageStateModelCopyWithImpl;
@useResult
$Res call({
 List<AnalyticsStateModel> stateModelsList, double summaryAmount
});




}
/// @nodoc
class _$AnalyticsPageStateModelCopyWithImpl<$Res>
    implements $AnalyticsPageStateModelCopyWith<$Res> {
  _$AnalyticsPageStateModelCopyWithImpl(this._self, this._then);

  final AnalyticsPageStateModel _self;
  final $Res Function(AnalyticsPageStateModel) _then;

/// Create a copy of AnalyticsPageStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stateModelsList = null,Object? summaryAmount = null,}) {
  return _then(_self.copyWith(
stateModelsList: null == stateModelsList ? _self.stateModelsList : stateModelsList // ignore: cast_nullable_to_non_nullable
as List<AnalyticsStateModel>,summaryAmount: null == summaryAmount ? _self.summaryAmount : summaryAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsPageStateModel].
extension AnalyticsPageStateModelPatterns on AnalyticsPageStateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsPageStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsPageStateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsPageStateModel value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsPageStateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsPageStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsPageStateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AnalyticsStateModel> stateModelsList,  double summaryAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsPageStateModel() when $default != null:
return $default(_that.stateModelsList,_that.summaryAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AnalyticsStateModel> stateModelsList,  double summaryAmount)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsPageStateModel():
return $default(_that.stateModelsList,_that.summaryAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AnalyticsStateModel> stateModelsList,  double summaryAmount)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsPageStateModel() when $default != null:
return $default(_that.stateModelsList,_that.summaryAmount);case _:
  return null;

}
}

}

/// @nodoc


class _AnalyticsPageStateModel implements AnalyticsPageStateModel {
  const _AnalyticsPageStateModel({required final  List<AnalyticsStateModel> stateModelsList, required this.summaryAmount}): _stateModelsList = stateModelsList;
  

 final  List<AnalyticsStateModel> _stateModelsList;
@override List<AnalyticsStateModel> get stateModelsList {
  if (_stateModelsList is EqualUnmodifiableListView) return _stateModelsList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stateModelsList);
}

@override final  double summaryAmount;

/// Create a copy of AnalyticsPageStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsPageStateModelCopyWith<_AnalyticsPageStateModel> get copyWith => __$AnalyticsPageStateModelCopyWithImpl<_AnalyticsPageStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsPageStateModel&&const DeepCollectionEquality().equals(other._stateModelsList, _stateModelsList)&&(identical(other.summaryAmount, summaryAmount) || other.summaryAmount == summaryAmount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_stateModelsList),summaryAmount);

@override
String toString() {
  return 'AnalyticsPageStateModel(stateModelsList: $stateModelsList, summaryAmount: $summaryAmount)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsPageStateModelCopyWith<$Res> implements $AnalyticsPageStateModelCopyWith<$Res> {
  factory _$AnalyticsPageStateModelCopyWith(_AnalyticsPageStateModel value, $Res Function(_AnalyticsPageStateModel) _then) = __$AnalyticsPageStateModelCopyWithImpl;
@override @useResult
$Res call({
 List<AnalyticsStateModel> stateModelsList, double summaryAmount
});




}
/// @nodoc
class __$AnalyticsPageStateModelCopyWithImpl<$Res>
    implements _$AnalyticsPageStateModelCopyWith<$Res> {
  __$AnalyticsPageStateModelCopyWithImpl(this._self, this._then);

  final _AnalyticsPageStateModel _self;
  final $Res Function(_AnalyticsPageStateModel) _then;

/// Create a copy of AnalyticsPageStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stateModelsList = null,Object? summaryAmount = null,}) {
  return _then(_AnalyticsPageStateModel(
stateModelsList: null == stateModelsList ? _self._stateModelsList : stateModelsList // ignore: cast_nullable_to_non_nullable
as List<AnalyticsStateModel>,summaryAmount: null == summaryAmount ? _self.summaryAmount : summaryAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$AnalyticsStateModel {

 CategoryModel get category; String? get lastTransactionComment; List<TransactionResponseModel> get transactions; double get amount; double get percentage;
/// Create a copy of AnalyticsStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsStateModelCopyWith<AnalyticsStateModel> get copyWith => _$AnalyticsStateModelCopyWithImpl<AnalyticsStateModel>(this as AnalyticsStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsStateModel&&(identical(other.category, category) || other.category == category)&&(identical(other.lastTransactionComment, lastTransactionComment) || other.lastTransactionComment == lastTransactionComment)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}


@override
int get hashCode => Object.hash(runtimeType,category,lastTransactionComment,const DeepCollectionEquality().hash(transactions),amount,percentage);

@override
String toString() {
  return 'AnalyticsStateModel(category: $category, lastTransactionComment: $lastTransactionComment, transactions: $transactions, amount: $amount, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class $AnalyticsStateModelCopyWith<$Res>  {
  factory $AnalyticsStateModelCopyWith(AnalyticsStateModel value, $Res Function(AnalyticsStateModel) _then) = _$AnalyticsStateModelCopyWithImpl;
@useResult
$Res call({
 CategoryModel category, String? lastTransactionComment, List<TransactionResponseModel> transactions, double amount, double percentage
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$AnalyticsStateModelCopyWithImpl<$Res>
    implements $AnalyticsStateModelCopyWith<$Res> {
  _$AnalyticsStateModelCopyWithImpl(this._self, this._then);

  final AnalyticsStateModel _self;
  final $Res Function(AnalyticsStateModel) _then;

/// Create a copy of AnalyticsStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? lastTransactionComment = freezed,Object? transactions = null,Object? amount = null,Object? percentage = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,lastTransactionComment: freezed == lastTransactionComment ? _self.lastTransactionComment : lastTransactionComment // ignore: cast_nullable_to_non_nullable
as String?,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionResponseModel>,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of AnalyticsStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnalyticsStateModel].
extension AnalyticsStateModelPatterns on AnalyticsStateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsStateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsStateModel value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsStateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsStateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CategoryModel category,  String? lastTransactionComment,  List<TransactionResponseModel> transactions,  double amount,  double percentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsStateModel() when $default != null:
return $default(_that.category,_that.lastTransactionComment,_that.transactions,_that.amount,_that.percentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CategoryModel category,  String? lastTransactionComment,  List<TransactionResponseModel> transactions,  double amount,  double percentage)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsStateModel():
return $default(_that.category,_that.lastTransactionComment,_that.transactions,_that.amount,_that.percentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CategoryModel category,  String? lastTransactionComment,  List<TransactionResponseModel> transactions,  double amount,  double percentage)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsStateModel() when $default != null:
return $default(_that.category,_that.lastTransactionComment,_that.transactions,_that.amount,_that.percentage);case _:
  return null;

}
}

}

/// @nodoc


class _AnalyticsStateModel implements AnalyticsStateModel {
  const _AnalyticsStateModel({required this.category, required this.lastTransactionComment, required final  List<TransactionResponseModel> transactions, required this.amount, required this.percentage}): _transactions = transactions;
  

@override final  CategoryModel category;
@override final  String? lastTransactionComment;
 final  List<TransactionResponseModel> _transactions;
@override List<TransactionResponseModel> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override final  double amount;
@override final  double percentage;

/// Create a copy of AnalyticsStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsStateModelCopyWith<_AnalyticsStateModel> get copyWith => __$AnalyticsStateModelCopyWithImpl<_AnalyticsStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsStateModel&&(identical(other.category, category) || other.category == category)&&(identical(other.lastTransactionComment, lastTransactionComment) || other.lastTransactionComment == lastTransactionComment)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}


@override
int get hashCode => Object.hash(runtimeType,category,lastTransactionComment,const DeepCollectionEquality().hash(_transactions),amount,percentage);

@override
String toString() {
  return 'AnalyticsStateModel(category: $category, lastTransactionComment: $lastTransactionComment, transactions: $transactions, amount: $amount, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsStateModelCopyWith<$Res> implements $AnalyticsStateModelCopyWith<$Res> {
  factory _$AnalyticsStateModelCopyWith(_AnalyticsStateModel value, $Res Function(_AnalyticsStateModel) _then) = __$AnalyticsStateModelCopyWithImpl;
@override @useResult
$Res call({
 CategoryModel category, String? lastTransactionComment, List<TransactionResponseModel> transactions, double amount, double percentage
});


@override $CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$AnalyticsStateModelCopyWithImpl<$Res>
    implements _$AnalyticsStateModelCopyWith<$Res> {
  __$AnalyticsStateModelCopyWithImpl(this._self, this._then);

  final _AnalyticsStateModel _self;
  final $Res Function(_AnalyticsStateModel) _then;

/// Create a copy of AnalyticsStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? lastTransactionComment = freezed,Object? transactions = null,Object? amount = null,Object? percentage = null,}) {
  return _then(_AnalyticsStateModel(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,lastTransactionComment: freezed == lastTransactionComment ? _self.lastTransactionComment : lastTransactionComment // ignore: cast_nullable_to_non_nullable
as String?,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionResponseModel>,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of AnalyticsStateModel
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
