import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_action.g.dart';

@riverpod
class TransactionAction extends _$TransactionAction {
  @override
  TransactionResponseModel? build({
    required TransactionResponseModel? model,
  }) {
    return model;
  }
}
