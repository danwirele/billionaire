import 'package:billionaire/src/domain/models/category/category_model.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/modal_bottom_sheet_extension.dart';
import 'package:flutter/material.dart';

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({
    required this.categoryNotifier,
    required this.isIncome,
    super.key,
  });

  final bool isIncome;
  final ValueNotifier<CategoryModel?> categoryNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CategoryModel?>(
      valueListenable: categoryNotifier,
      builder: (context, category, _) {
        return BillionPinnedContainer.transparentLarge(
          onTap: () async {
            final selectedCategory = await context.showCategories(
              isIncome: isIncome,
            );
            if (selectedCategory != null) {
              categoryNotifier.value = selectedCategory;
            }
          },
          leading: BillionText.bodyLarge(
            context.localization.category,
          ),
          action: Row(
            children: [
              BillionText.bodyLarge(
                category?.name ?? context.localization.notSelected,
              ),
              const BillionArrowRight(),
            ],
          ),
        );
      },
    );
  }
}
