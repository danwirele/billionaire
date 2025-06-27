import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/presentation/pages/transaction/analysis/widgets/analysis_content.dart';
import 'package:billionaire/src/presentation/pages/transaction/analysis/widgets/analysis_dates.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage.expense({super.key}) : isIncome = false;
  const AnalysisPage.income({super.key}) : isIncome = true;

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return BillionScaffold(
      appBar: BillionAppBar(
        title: 'Аналитика',
        backgroundColor: BillionColors.surface,
        actionIcon: IconButton(
          onPressed: () {},
          icon: Assets.icons.historyOutline.svg(
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              BillionColors.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const AnalysisDates(),
          Expanded(
            child: AnalysisContent(isIncome: isIncome),
          ),
        ],
      ),
    );
  }
}
