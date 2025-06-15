import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_text.dart';
import 'package:billionaire/src/presentation/ui_kit/theme/billion_colors.dart';
import 'package:flutter/material.dart';

class BillionPinnedContainer extends StatelessWidget {
  const BillionPinnedContainer({
    super.key,
    required this.leadingText,
    required this.action,
  });

  final String leadingText;
  final Widget action;

  static const double _rowHeight = 56.0;
  static const EdgeInsets _rowPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: _rowHeight,
          padding: _rowPadding,
          color: BillionColors.onPrimary,
          child: Row(
            children: [
              BillionText.bodyLarge(leadingText),
              Spacer(),
              action,
            ],
          ),
        ),
        Divider(height: 1, color: BillionColors.outlineVariant),
      ],
    );
  }
}
