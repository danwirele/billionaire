// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_create_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountCreateRequest _$AccountCreateRequestFromJson(
  Map<String, dynamic> json,
) => _AccountCreateRequest(
  name: json['name'] as String,
  balance: json['balance'] as String,
  currency: json['currency'] as String,
);

Map<String, dynamic> _$AccountCreateRequestToJson(
  _AccountCreateRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'balance': instance.balance,
  'currency': instance.currency,
};
