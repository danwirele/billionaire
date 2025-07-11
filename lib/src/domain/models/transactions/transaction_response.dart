import 'package:billionaire/src/domain/models/account/account_brief_model.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_response.freezed.dart';
part 'transaction_response.g.dart';

@freezed
abstract class TransactionResponseModel with _$TransactionResponseModel {
  const factory TransactionResponseModel({
    required int id,
    required AccountBriefModel account,
    required CategoryModel category,
    required String amount,
    @DateTimeConverter() required DateTime transactionDate,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? comment,
  }) = _TransactionResponseModel;

  factory TransactionResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$TransactionResponseModelFromJson(json);
}

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();
  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json).toLocal();
  }

  @override
  String toJson(DateTime object) {
    return object.toUtc().toIso8601String();
  }
}
