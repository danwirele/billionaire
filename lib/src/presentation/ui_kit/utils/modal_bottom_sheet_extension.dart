import 'package:billionaire/core/enum/filter_option.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/widgets/filter_element.dart';
import 'package:flutter/material.dart';

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
}
