// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_brief_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountBriefModel _$AccountBriefModelFromJson(Map<String, dynamic> json) =>
    _AccountBriefModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      balance: json['balance'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$AccountBriefModelToJson(_AccountBriefModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'currency': instance.currency,
    };
