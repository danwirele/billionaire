import 'package:billionaire/src/domain/models/account_history/account_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_history.freezed.dart';
part 'account_history.g.dart';

@freezed
abstract class AccountHistoryModel with _$AccountHistoryModel {
  const factory AccountHistoryModel({
    required int id,
    required int accountId,
    required String changeType,
    required AccountStateModel previousState,
    required AccountStateModel newState,
    required DateTime changeTimestamp,
    required DateTime createdAt,
  }) = _AccountHistoryModel;

  factory AccountHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$AccountHistoryModelFromJson(json);
}
