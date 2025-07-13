part of '../ui_kit.dart';

class BillionDivider extends StatelessWidget {
  const BillionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Divider(
      height: 1,
      color: colorScheme.outlineVariant,
    );
  }
}
