import 'package:billionaire/src/domain/controllers/transactions_repository.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_request.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_action.g.dart';

@Riverpod(dependencies: [TransactionsRepository])
class TransactionAction extends _$TransactionAction {
  @override
  TransactionResponseModel? build({
    required TransactionResponseModel? model,
  }) {
    return model;
  }

  Future<void> saveTransaction({
    required TransactionRequestModel newModel,
    int? transactionId,
  }) async {
    final controller = ref.read(
      transactionsRepositoryProvider.notifier,
    );

    if (model == null) {
      //todo Вызывать создание
      await controller.createTransaction(newModel: newModel);
    } else {
      //todo Вызывать обновление
      await controller.updateTransaction(
        id: transactionId!,
        newModel: newModel,
      );
    }
  }

  Future<void> deleteTransaction({
    required int transactionId,
  }) async {
    final controller = ref.read(
      transactionsRepositoryProvider.notifier,
    );

    await controller.deleteTransaction(id: transactionId);
  }
}
