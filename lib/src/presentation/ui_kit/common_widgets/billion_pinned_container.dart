import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class BillionPinnedContainer extends StatelessWidget {
  const BillionPinnedContainer({
    required this.leading,
    required this.action,
    super.key,
    this.onTap,
    this.containerColor = BillionColors.primaryContainer,
  });

  final Widget leading;
  final Widget action;
  final void Function()? onTap;
  final Color containerColor;

  static const double _rowHeight = 56.0;
  static const EdgeInsets _rowPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: _rowHeight,
              padding: _rowPadding,
              color: containerColor,
              child: Row(
                children: [
                  leading,
                  const Spacer(),
                  action,
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: BillionColors.outlineVariant,
            ),
          ],
        ),
      ),
    );
  }
}
