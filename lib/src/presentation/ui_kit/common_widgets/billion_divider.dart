part of '../ui_kit.dart';

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
