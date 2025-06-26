import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class BillionDivider extends StatelessWidget {
  const BillionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      color: BillionColors.outlineVariant,
    );
  }
}
