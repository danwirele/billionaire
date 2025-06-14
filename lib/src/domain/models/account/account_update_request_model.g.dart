// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_update_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountUpdateRequestModel _$AccountUpdateRequestModelFromJson(
  Map<String, dynamic> json,
) => _AccountUpdateRequestModel(
  name: json['name'] as String?,
  balance: json['balance'] as String?,
  currency: json['currency'] as String?,
);

Map<String, dynamic> _$AccountUpdateRequestModelToJson(
  _AccountUpdateRequestModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'balance': instance.balance,
  'currency': instance.currency,
};
