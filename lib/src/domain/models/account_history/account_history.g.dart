// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountHistoryModel _$AccountHistoryModelFromJson(Map<String, dynamic> json) =>
    _AccountHistoryModel(
      id: (json['id'] as num).toInt(),
      accountId: (json['accountId'] as num).toInt(),
      changeType: json['changeType'] as String,
      previousState: AccountStateModel.fromJson(
        json['previousState'] as Map<String, dynamic>,
      ),
      newState: AccountStateModel.fromJson(
        json['newState'] as Map<String, dynamic>,
      ),
      changeTimestamp: DateTime.parse(json['changeTimestamp'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AccountHistoryModelToJson(
  _AccountHistoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'accountId': instance.accountId,
  'changeType': instance.changeType,
  'previousState': instance.previousState,
  'newState': instance.newState,
  'changeTimestamp': instance.changeTimestamp.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
};
