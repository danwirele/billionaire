import 'package:billionaire/core/enum/filter_option.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/controllers/transaction_filter.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterElement extends ConsumerWidget {
  const FilterElement({
    required this.filterName,
    required this.filterOption,
    super.key,
  });

  final FilterOption filterOption;
  final String filterName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerFilterOption = ref.watch(transactionFilterProvider);

    return InkWell(
      onTap: () {
        ref.read(transactionFilterProvider.notifier).setTransactionFilter(filterOption, filterName);
        GoRouter.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BillionText.bodyMedium(filterName),
            providerFilterOption?.filterOption == filterOption ? const Icon(Icons.check_circle, color: Colors.blue) : const Icon(Icons.circle_outlined),
          ],
        ),
      ),
    );
  }
}
