// Работы с Categories (получение списка всех категорий/списка категорий расходов и доходов)
// Работы со счётом BankAccount (получение, изменение)
// Работы с Transactions (получение, добавление, изменение, удаление)
import 'package:billionaire/src/domain/models/transactions/transaction.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_request.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';

/// [TransactionRepository] - репозиторий для работы с [TransactionModel]
abstract interface class TransactionRepository {
  /// [createTransaction] метод для создания транзакций (доход или расход)
  Future<TransactionModel?> createTransaction(
    TransactionRequestModel model,
  );

  /// [getTransactionById] метод для получения информации о конкретной транзакции
  /// [id] - ID транзакции.
  Future<TransactionResponseModel> getTransactionById(int id);

  /// [updateTransaction] метод для обновления существующей транзакции
  /// [id] - ID транзакции;
  /// [updatedModel] - обновленная модель транзакции;
  Future<TransactionResponseModel?> updateTransaction({
    required int id,
    required TransactionRequestModel updatedModel,
  });

  /// [deleteTransaction] метод удаления транзакции с возможностью возврата средств на счет
  /// [id] - ID транзакции;
  /// [deleteModel] - удаляемая модель транзакции;
  Future<void> deleteTransaction({
    required int id,
    required TransactionModel deleteModel,
  });

  /// [updateTransaction] метод для обновления существующей транзакции
  /// [accountId] - ID выбранного счета;
  ///
  /// [startDate] - Начальная дата периода (YYYY-MM-DD).
  /// Если не указана, используется начало текущего месяца;
  ///
  /// [endDate] - Конечная дата периода (YYYY-MM-DD).
  ///  Если не указана, используется конец текущего месяца.
  Future<List<TransactionResponseModel>> getTransactionsByPeriod({
    required int accountId,
    required DateTime startDate,
    required DateTime endDate,
  });
}
