import 'package:billionaire/src/presentation/pages/transaction/analysis/widgets/analysis_content.dart';
import 'package:billionaire/src/presentation/pages/transaction/analysis/widgets/analysis_dates.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage.expense({super.key}) : isIncome = false;
  const AnalysisPage.income({super.key}) : isIncome = true;

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return BillionScaffold(
      appBar: BillionAppBar(
        isTransparent: true,
        title: context.localization.appBarAnalysis,
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
