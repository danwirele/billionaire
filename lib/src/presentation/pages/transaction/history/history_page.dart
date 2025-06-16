// ignore_for_file: prefer_final_fields

import 'package:billionaire/src/domain/controllers/account_transactions_repository.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_pinned_container.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_stat_widget.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage.expense({super.key}) : isIncome = false;
  const HistoryPage.income({super.key}) : isIncome = true;

  final bool isIncome;

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final accountTransactionsProvider =
        transactionsRepositoryProvider(isIncome: widget.isIncome);
    final currencyProviderValue = ref.getCurrency();

    final accountTransactionsProviderNotifier = ref.read(
      accountTransactionsProvider.notifier,
    );

    // final transactionAmmountSum = accountTransactionsProviderNotifier
    //     .getTransactionAmmount();

    return BillionScaffold(
      body: Column(
        children: [
          BillionPinnedContainer(
            leadingText: 'Начало',
            action: BillionText.bodyLarge(_startDate.toddMMyyyy()),
          ),
          BillionPinnedContainer(
            leadingText: 'Конец',
            action: BillionText.bodyLarge(_endDate.toddMMyyyy()),
          ),
          BillionPinnedContainer(
            leadingText: 'Сортировка',
            action: Flexible(child: Placeholder()),
          ),
          // BillionPinnedContainer(
          //   leadingText: 'Всего',
          //   action: BillionText.bodyLarge(
          //     '${(transactionAmmountSum).formatNumber()} $currencyProviderValue',
          //   ),
          // ),
          ref
              .watch(accountTransactionsProvider)
              .when(
                data: (transactionList) {
                  if (transactionList == null) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          'Извините, произошла ошибка, счет не найден',
                        ),
                      ),
                    );
                  }

                  if (transactionList.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Text('Транзакции отсутствуют'),
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: transactionList.length,
                      itemBuilder: (context, index) {
                        final transaction = transactionList[index];
                        final category = transaction.category;

                        return BillionStatWidget(
                          statTitle: category.name,
                          statDescription: transaction.comment,
                          transactionAmount: transaction.amount,

                          currency: currencyProviderValue.name,
                          leadingEmoji: category.emoji,
                        );
                      },
                    ),
                  );
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: BillionColors.onPrimary,
                      color: BillionColors.primary,
                    ),
                  ),
                ),
              ),
        ],
      ),
      appBar: BillionAppBar(title: 'Моя история'),
    );
  }
}
