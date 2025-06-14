import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.freezed.dart';
part 'account_state.g.dart';

@freezed
abstract class AccountStateModel with _$AccountStateModel {
  const factory AccountStateModel({
    required int id,
    required String name,
    required String balance,
    required String currency,
  }) = _AccountStateModel;

  factory AccountStateModel.fromJson(Map<String, dynamic> json) =>
      _$AccountStateModelFromJson(json);
}
