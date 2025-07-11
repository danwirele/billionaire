// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionResponseModel _$TransactionResponseModelFromJson(
  Map<String, dynamic> json,
) => _TransactionResponseModel(
  id: (json['id'] as num).toInt(),
  account: AccountBriefModel.fromJson(json['account'] as Map<String, dynamic>),
  category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  amount: json['amount'] as String,
  transactionDate: const DateTimeConverter().fromJson(
    json['transactionDate'] as String,
  ),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$TransactionResponseModelToJson(
  _TransactionResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'account': instance.account,
  'category': instance.category,
  'amount': instance.amount,
  'transactionDate': const DateTimeConverter().toJson(instance.transactionDate),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'comment': instance.comment,
};
