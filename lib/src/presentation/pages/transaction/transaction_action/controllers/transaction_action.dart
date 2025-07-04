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

  Future<void> saveTransaction({required TransactionResponseModel newTransaction}) async {
    if (model == null) {
      //todo Вызывать создание
    } else {
      //todo Вызывать обновление
    }
  }
}
