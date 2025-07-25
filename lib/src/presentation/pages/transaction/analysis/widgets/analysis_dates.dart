import 'package:billionaire/src/presentation/pages/transaction/analysis/controllers/analysis_filter.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnalysisDates extends ConsumerWidget {
  const AnalysisDates({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(analysisFilterProvider);
    final colorScheme = context.colorScheme;

    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: date.startDate,
          builder: (context, value, child) {
            return BillionPinnedContainer.transparentMedium(
              onTap: () async {
                final newDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                  initialDate: value,
                );
                if (newDate != null) {
                  await ref
                      .read(
                        analysisFilterProvider.notifier,
                      )
                      .setStartDate(newDate);
                }
              },
              leading: BillionText.bodyLarge(
                context.localization.periodBeginning,
              ),
              action: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  color: colorScheme.primary,
                ),
                child: BillionText.titleMedium(
                  value.toddMMyyyy(),
                ),
              ),
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: date.endDate,
          builder: (context, value, child) =>
              BillionPinnedContainer.transparentMedium(
                onTap: () async {
                  final newDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    initialDate: value,
                  );

                  if (newDate != null) {
                    await ref
                        .read(
                          analysisFilterProvider.notifier,
                        )
                        .setEndDate(newDate);
                  }
                },
                leading: BillionText.bodyLarge(
                  context.localization.periodEnd,
                ),
                action: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                    color: colorScheme.primary,
                  ),
                  child: BillionText.titleMedium(
                    value.toddMMyyyy(),
                  ),
                ),
              ),
        ),
      ],
    );
  }
}
