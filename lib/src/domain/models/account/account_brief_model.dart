import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_brief_model.freezed.dart';
part 'account_brief_model.g.dart';

@freezed
abstract class AccountBriefModel with _$AccountBriefModel {
  const factory AccountBriefModel({
    required int id,
    required String name,
    required String balance,
    required String currency,
  }) = _AccountBriefModel;

  factory AccountBriefModel.fromJson(Map<String, dynamic> json) =>
      _$AccountBriefModelFromJson(json);
}
