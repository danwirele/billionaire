import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_request.freezed.dart';
part 'transaction_request.g.dart';

@freezed
abstract class TransactionRequestModel
    with _$TransactionRequestModel {
  const factory TransactionRequestModel({
    required int accountId,
    required int categoryId,
    required String amount,
    required DateTime transactionDate,
    String? comment,
  }) = _TransactionRequestModel;

  factory TransactionRequestModel.fromJson(
    Map<String, dynamic> json,
  ) => _$TransactionRequestModelFromJson(json);
}
