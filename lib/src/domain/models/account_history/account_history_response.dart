import 'package:billionaire/src/domain/models/account_history/account_history.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_history_response.freezed.dart';
part 'account_history_response.g.dart';

@freezed
abstract class AccountHistoryResponseModel
    with _$AccountHistoryResponseModel {
  const factory AccountHistoryResponseModel({
    required int accountId,
    required String accountName,
    required String currency,
    required String currentBalance,
    required List<AccountHistoryModel> history,
  }) = _AccountHistoryResponseModel;

  factory AccountHistoryResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountHistoryResponseModelFromJson(json);
}
