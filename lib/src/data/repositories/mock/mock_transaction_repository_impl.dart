import 'package:billionaire/src/domain/models/account/account_brief_model.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/domain/models/transactions/transaction.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_request.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/domain/repositories/transaction_repository.dart';

class MockTransactionRepositoryImpl implements TransactionRepository {
  MockTransactionRepositoryImpl() {
    resetMockData();
  }

  // Список фиктивных транзакций
  final List<TransactionModel> _mockTransactions = [];
  final List<TransactionResponseModel> _mockTransactionsResponses = [];

  @override
  Future<TransactionModel?> createTransaction(
    TransactionRequestModel model,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    // Создаем новую транзакцию с уникальным ID
    final newTransaction = TransactionModel(
      id: _mockTransactions.length + 1,
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
    await Future<void>.delayed(const Duration(milliseconds: 200));

    final transaction = _mockTransactions.firstWhere(
      (t) => t.id == id,
      orElse: () => throw Exception('Transaction with id $id not found'),
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
    await Future<void>.delayed(const Duration(milliseconds: 250));

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
  Future<void> deleteTransaction({required int id}) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    final index = _mockTransactions.indexWhere((t) => t.id == id);
    if (index == -1) {
      throw Exception('Transaction with id $id not found');
    }

    _mockTransactions.removeAt(index);
  }

  @override
  Future<List<TransactionResponseModel>> getTransactionsByPeriod({
    required int accountId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final filteredTransactions = _mockTransactionsResponses.where((
      transaction,
    ) {
      final isCorrectAccount = transaction.account.id == accountId;

      final isWithinDateRange = transaction.transactionDate.isAfter(startDate) && transaction.transactionDate.isBefore(endDate);

      return isCorrectAccount && isWithinDateRange;
    }).toList();

    return filteredTransactions;
  }

  /// Вспомогательный метод для тестов: сброс данных в исходное состояние
  void resetMockData() {
    _mockTransactions.clear();
    _mockTransactionsResponses.clear();

    final today = DateTime.now().add(
      const Duration(minutes: 10),
    );

    final yesterday = today.subtract(const Duration(days: 29));

    _mockTransactionsResponses.addAll([
      TransactionResponseModel(
        id: 1,
        account: const AccountBriefModel(
          id: 1,
          name: 'Mock Account',
          balance: '1000',
          currency: 'RUB',
        ),
        category: const CategoryModel(
          id: 1,
          name: 'Аренда квартиры',
          emoji: '🏠',
          isIncome: false,
        ),
        amount: '5001',
        transactionDate: yesterday,
        comment: 'аренда',
        createdAt: yesterday,
        updatedAt: today,
      ),
      TransactionResponseModel(
        id: 2,
        account: const AccountBriefModel(
          id: 1,
          name: 'Mock Account',
          balance: '1000',
          currency: 'RUB',
        ),
        category: const CategoryModel(
          id: 2,
          name: 'Одежда',
          emoji: '💰',
          isIncome: false,
        ),
        amount: '5002',
        transactionDate: yesterday,
        comment: 'Платье',
        createdAt: yesterday,
        updatedAt: today,
      ),
      TransactionResponseModel(
        id: 3,
        account: const AccountBriefModel(
          id: 1,
          name: 'Mock Account',
          balance: '1000',
          currency: 'RUB',
        ),
        category: const CategoryModel(
          id: 3,
          name: 'На собачку',
          emoji: '🐶',
          isIncome: false,
        ),
        amount: '5003',
        transactionDate: yesterday,
        comment: 'Собачка',
        createdAt: yesterday,
        updatedAt: today,
      ),
      TransactionResponseModel(
        id: 4,
        account: const AccountBriefModel(
          id: 1,
          name: 'Mock Account',
          balance: '1000',
          currency: 'RUB',
        ),
        category: const CategoryModel(
          id: 4,
          name: 'Продукты',
          emoji: '🍭',
          isIncome: false,
        ),
        amount: '5004',
        transactionDate: today.add(
          const Duration(minutes: 10),
        ),
        comment: 'Собачка',
        createdAt: today,
        updatedAt: today,
      ),
      TransactionResponseModel(
        id: 5,
        account: const AccountBriefModel(
          id: 1,
          name: 'Mock Account',
          balance: '1000',
          currency: 'RUB',
        ),
        category: const CategoryModel(
          id: 5,
          name: 'Спортзал',
          emoji: '🏋',
          isIncome: false,
        ),
        amount: '5005',
        transactionDate: today.add(
          const Duration(minutes: 10),
        ),
        createdAt: today,
        updatedAt: today,
      ),
      TransactionResponseModel(
        id: 6,
        account: const AccountBriefModel(
          id: 1,
          name: 'Mock Account',
          balance: '1000',
          currency: 'RUB',
        ),
        category: const CategoryModel(
          id: 6,
          name: 'Медицина',
          emoji: '💊',
          isIncome: false,
        ),
        amount: '5006',
        transactionDate: today.add(
          const Duration(minutes: 10),
        ),
        createdAt: today,
        updatedAt: today,
      ),
      TransactionResponseModel(
        id: 7,
        account: const AccountBriefModel(
          id: 1,
          name: 'Mock Account',
          balance: '1000',
          currency: 'RUB',
        ),
        category: const CategoryModel(
          id: 7,
          name: 'Зарплата',
          emoji: '',
          isIncome: true,
        ),
        amount: '100000',
        transactionDate: today.add(
          const Duration(minutes: 10),
        ),
        createdAt: today,
        updatedAt: today,
      ),
      TransactionResponseModel(
        id: 8,
        account: const AccountBriefModel(
          id: 1,
          name: 'Mock Account',
          balance: '1000',
          currency: 'RUB',
        ),
        category: const CategoryModel(
          id: 8,
          name: 'Подработка',
          emoji: '',
          isIncome: true,
        ),
        amount: '15000',
        transactionDate: today.add(
          const Duration(minutes: 10),
        ),
        comment: 'Калым',
        createdAt: today,
        updatedAt: today,
      ),
    ]);
  }
}
