import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_update_request_model.freezed.dart';
part 'account_update_request_model.g.dart';

@freezed
abstract class AccountUpdateRequestModel
    with _$AccountUpdateRequestModel {
  const factory AccountUpdateRequestModel({
    required String name,
    required String balance,
    required String currency,
  }) = _AccountUpdateRequestModel;

  factory AccountUpdateRequestModel.fromJson(
    Map<String, dynamic> json,
  ) => _$AccountUpdateRequestModelFromJson(json);
}
