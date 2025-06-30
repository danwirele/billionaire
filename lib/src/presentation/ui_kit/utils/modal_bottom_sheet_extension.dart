import 'dart:developer';

import 'package:billionaire/core/enum/currency_enum.dart';
import 'package:billionaire/core/enum/filter_option.dart';
import 'package:billionaire/src/domain/controllers/categories_repository.dart';
import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/domain/models/transactions/transaction_response.dart';
import 'package:billionaire/src/presentation/pages/account/widgets/currency_tile.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/widgets/filter_element.dart';
import 'package:billionaire/src/presentation/pages/transaction/widgets/billion_stat_widget.dart';
import 'package:billionaire/src/presentation/shared/controllers/currency_provider.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension ModalBottomSheet on BuildContext {
  Future<void> showFilterBottomSheet() async {
    await showModalBottomSheet<void>(
      context: this,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Фильтры',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          FilterElement(
            filterOption: FilterOption.dateAscending,
          ),
          FilterElement(
            filterOption: FilterOption.dateDescending,
          ),
          FilterElement(
            filterOption: FilterOption.priceAscending,
          ),
          FilterElement(
            filterOption: FilterOption.priceDescending,
          ),
        ],
      ),
    );
  }

  Future<void> showCurrencyBottomSheet() async {
    const currencyList = Currency.values;
    await showModalBottomSheet<void>(
      context: this,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListView.separated(
              itemCount: currencyList.length,
              itemBuilder: (context, index) {
                return CurrencyTile(
                  currency: currencyList[index],
                );
              },
              separatorBuilder: (context, index) =>
                  const Divider(height: 1),
            ),
          ),
          const Divider(height: 1),

          ListTile(
            onTap: GoRouter.of(context).pop,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 14,
            ),
            tileColor: BillionColors.error,
            leading: const Icon(
              Icons.cancel_outlined,
              size: 24,
              color: BillionColors.onPrimary,
            ),
            title: const Text(
              'Отмена',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showDetailsTransactions(
    List<TransactionResponseModel> transactions,
  ) async {
    await showModalBottomSheet<void>(
      context: this,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => Consumer(
        builder: (context, ref, child) {
          final currency = ref.read(currencyProviderProvider);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              final category = transaction.category;

              return BillionStatWidget(
                statTitle: category.name,
                statDescription: transaction.comment,
                action: BillionText.bodyLarge(
                  '${transaction.amount} ${currency.char}',
                ),
                leadingEmoji: category.emoji,
              );
            },
          );
        },
      ),
    );
  }

  Future<CategoryModel?> showCategories() async {
    return showModalBottomSheet<CategoryModel>(
      context: this,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => Consumer(
        builder: (context, ref, child) {
          return ref
              .watch(
                categoriesRepositoryProvider,
              )
              .when(
                data: (categories) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];

                      return BillionStatWidget(
                        actionCallBack: () async {
                          GoRouter.of(context).pop(category);
                        },
                        leadingEmoji: category.emoji,
                        statTitle: category.name,
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  log(error.toString());
                  log(stackTrace.toString());
                  return const Text(
                    'Извините, произошла ошибка получения категорий',
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
        },
      ),
    );
  }
}
