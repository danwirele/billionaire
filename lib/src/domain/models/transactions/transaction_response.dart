import 'package:billionaire/src/domain/models/account/account_brief_model.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_response.freezed.dart';
part 'transaction_response.g.dart';

@freezed
abstract class TransactionResponseModel
    with _$TransactionResponseModel {
  const factory TransactionResponseModel({
    required int id,
    required AccountBriefModel account,
    required CategoryModel category,
    required String amount,
    required DateTime transactionDate,
    String? comment,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransactionResponseModel;

  factory TransactionResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$TransactionResponseModelFromJson(json);
}
