import 'package:billionaire/core/enum/currency_enum.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/history_transactions.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_stat_widget.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/dialogs_extension.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/invoke_function.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryTransactionsContent extends ConsumerWidget {
  const HistoryTransactionsContent({
    required this.currencyProviderValue,
    required this.historyTransactionStateModel,
    super.key,
  });

  final Currency currencyProviderValue;
  final HistoryTransactionStateModel historyTransactionStateModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        BillionPinnedContainer.primaryMedium(
          leading: BillionText.bodyLarge('Всего'),
          action: BillionText.bodyLarge(
            '${historyTransactionStateModel.amount.formatNumber()} ${currencyProviderValue.char}',
          ),
        ),

        Expanded(
          child: historyTransactionStateModel.transactions.isEmpty
              ? const Center(
                  child: Text(
                    'Транзакции отсуствуют',
                  ),
                )
              : ListView.builder(
                  itemCount: historyTransactionStateModel.transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = historyTransactionStateModel.transactions[index];
                    final category = transaction.category;

                    return BillionStatWidget(
                      actionCallBack: () async {
                        await context.invokeMethodWrapper(() async {
                          await context.showTransactionActionDialog(
                            isIncome: category.isIncome,
                          );
                        });
                      },
                      statTitle: category.name,
                      statDescription: transaction.comment,

                      subAction: BillionText.bodyLarge(
                        transaction.transactionDate.toHHmm(),
                      ),
                      action: BillionText.bodyLarge(
                        '${transaction.amount} ${currencyProviderValue.char}',
                      ),
                      leadingEmoji: category.emoji,
                    );
                  },
                ),
        ),
      ],
    );
  }
}
