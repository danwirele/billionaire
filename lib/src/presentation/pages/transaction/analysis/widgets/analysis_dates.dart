import 'package:billionaire/src/presentation/pages/transaction/analysis/controllers/analysis_filter.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_pinned_container.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnalysisDates extends ConsumerWidget {
  const AnalysisDates({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(analysisFilterProvider);

    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: date.startDate,
          builder: (context, value, child) {
            return BillionPinnedContainer(
              containerColor: Colors.transparent,
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
              leading: const BillionText.bodyLarge(
                'Начало',
              ),
              action: BillionText.bodyLarge(
                value.toddMMyyyy(),
              ),
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: date.endDate,
          builder: (context, value, child) => BillionPinnedContainer(
            containerColor: Colors.transparent,
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
            leading: const BillionText.bodyLarge(
              'Конец',
            ),
            action: BillionText.bodyLarge(
              value.toddMMyyyy(),
            ),
          ),
        ),
      ],
    );
  }
}
