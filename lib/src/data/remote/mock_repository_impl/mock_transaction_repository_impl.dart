import 'package:billionaire/src/domain/models/account/account_brief_model.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/domain/models/transactions/transaction.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_request.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/domain/repositories/transaction_repository.dart';

class MockTransactionRepositoryImpl implements TransactionRepository {
  // Список фиктивных транзакций
  final List<TransactionModel> _mockTransactions = [];

  // Переменная для контроля ID транзакций
  int _nextId = 1;

  @override
  Future<TransactionModel?> createTransaction(
    TransactionRequestModel model,
  ) async {
    await Future.delayed(const Duration(milliseconds: 300));

    // Создаем новую транзакцию с уникальным ID
    final newTransaction = TransactionModel(
      id: _nextId++,
      accountId: model.accountId,
      categoryId: model.categoryId,
      amount: model.amount,
      transactionDate: model.transactionDate,
      comment: model.comment,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    _mockTransactions.add(newTransaction);
    return newTransaction;
  }

  @override
  Future<TransactionResponseModel> getTransactionById(int id) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final transaction = _mockTransactions.firstWhere(
      (t) => t.id == id,
      orElse: () =>
          throw Exception('Transaction with id $id not found'),
    );

    // Преобразуем TransactionModel в TransactionResponseModel
    return TransactionResponseModel(
      id: transaction.id,
      account: AccountBriefModel(
        id: transaction.accountId,
        name: 'Mock Account',
        balance: '1000',
        currency: 'RUB',
      ),
      category: CategoryModel(
        id: transaction.categoryId,
        name: 'Mock Category',
        emoji: '💰',
        isIncome: false,
      ),
      amount: transaction.amount,
      transactionDate: transaction.transactionDate,
      comment: transaction.comment,
      createdAt: transaction.createdAt,
      updatedAt: transaction.updatedAt,
    );
  }

  @override
  Future<TransactionResponseModel?> updateTransaction({
    required int id,
    required TransactionRequestModel updatedModel,
  }) async {
    await Future.delayed(const Duration(milliseconds: 250));

    final index = _mockTransactions.indexWhere((t) => t.id == id);
    if (index == -1) return null;

    // Обновляем данные транзакции
    final updatedTransaction = _mockTransactions[index].copyWith(
      accountId: updatedModel.accountId,
      categoryId: updatedModel.categoryId,
      amount: updatedModel.amount,
      transactionDate: updatedModel.transactionDate,
      comment: updatedModel.comment,
      updatedAt: DateTime.now(),
    );

    _mockTransactions[index] = updatedTransaction;

    // Преобразуем обновленную транзакцию в TransactionResponseModel
    return TransactionResponseModel(
      id: updatedTransaction.id,
      account: AccountBriefModel(
        id: updatedTransaction.accountId,
        name: 'Mock Account',
        balance: '1000',
        currency: 'RUB',
      ),
      category: CategoryModel(
        id: updatedTransaction.categoryId,
        name: 'Mock Category',
        emoji: '💰',
        isIncome: false,
      ),
      amount: updatedTransaction.amount,
      transactionDate: updatedTransaction.transactionDate,
      comment: updatedTransaction.comment,
      createdAt: updatedTransaction.createdAt,
      updatedAt: updatedTransaction.updatedAt,
    );
  }

  @override
  Future<void> deleteTransaction({
    required int id,
    required TransactionModel deleteModel,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final index = _mockTransactions.indexWhere((t) => t.id == id);
    if (index == -1) {
      throw Exception('Transaction with id $id not found');
    }

    _mockTransactions.removeAt(index);
  }

  /// Вспомогательный метод для тестов: сброс данных в исходное состояние
  void resetMockData() {
    _mockTransactions.clear();
    _nextId = 1;
  }
}
