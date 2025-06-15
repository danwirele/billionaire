// ignore_for_file: prefer_final_fields

import 'package:billionaire/src/presentation/pages/transaction/controllers/account_transactions_repository.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_pinned_container.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_stat_widget.dart';
import 'package:billionaire/src/presentation/shared/controllers/currency_provider.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_app_bar.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_scaffold.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_text.dart';
import 'package:billionaire/src/presentation/ui_kit/theme/billion_colors.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/number_extension.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/time_extension.dart';
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
  late final AccountTransactionsRepositoryProvider
  accountTransactionsProvider;

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  @override
  void initState() {
    accountTransactionsProvider =
        accountTransactionsRepositoryProvider(
          isIncome: widget.isIncome,
        );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(accountTransactionsProvider.notifier)
          .setTransactionsByPeriod(
            startDate: _startDate,
            endDate: DateTime(
              _endDate.year,
              _endDate.month,
              _endDate.day,
              23,
              59,
              59,
            ),
            isIncome: widget.isIncome,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currencyProviderValue = ref.read(currencyProviderProvider);

    final accountTransactionsProviderNotifier = ref.read(
      accountTransactionsProvider.notifier,
    );

    final transactionAmmountSum = accountTransactionsProviderNotifier
        .getTransactionAmmount();

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
          BillionPinnedContainer(
            leadingText: 'Всего',
            action: BillionText.bodyLarge(
              '${(transactionAmmountSum).formatNumber()} $currencyProviderValue',
            ),
          ),
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

                          currency: currencyProviderValue,
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
