import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class BillionPinnedContainer extends StatelessWidget {
  const BillionPinnedContainer({
    required this.leadingText,
    required this.action,
    super.key,
    this.onTap,
  });

  final String leadingText;
  final Widget action;
  final void Function()? onTap;

  static const double _rowHeight = 56.0;
  static const EdgeInsets _rowPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: _rowHeight,
            padding: _rowPadding,
            color: BillionColors.onPrimary,
            child: Row(
              children: [
                BillionText.bodyLarge(leadingText),
                const Spacer(),
                action,
              ],
            ),
          ),
          const Divider(height: 1, color: BillionColors.outlineVariant),
        ],
      ),
    );
  }
}
