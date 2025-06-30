part of '../ui_kit.dart';

class BillionPinnedContainer extends StatelessWidget {
  const BillionPinnedContainer.primaryMedium({
    required this.leading,
    required this.action,
    super.key,
    this.onTap,
    this.containerColor = BillionColors.primaryContainer,
  }) : _rowPadding = const EdgeInsets.symmetric(
         horizontal: 16,
         vertical: 16,
       );
  const BillionPinnedContainer.primaryLarge({
    required this.leading,
    required this.action,
    super.key,
    this.onTap,
    this.containerColor = BillionColors.primaryContainer,
  }) : _rowPadding = const EdgeInsets.symmetric(
         horizontal: 16,
         vertical: 16,
       );

  const BillionPinnedContainer.transparentMedium({
    required this.leading,
    required this.action,
    super.key,
    this.onTap,
  }) : containerColor = Colors.transparent,
       _rowPadding = const EdgeInsets.symmetric(
         horizontal: 16,
         vertical: 16,
       );

  const BillionPinnedContainer.transparentLarge({
    required this.leading,
    required this.action,
    super.key,
    this.onTap,
  }) : containerColor = Colors.transparent,
       _rowPadding = const EdgeInsets.symmetric(
         horizontal: 16,
         vertical: 22,
       );

  final Widget leading;
  final Widget action;
  final void Function()? onTap;
  final Color containerColor;
  final EdgeInsets _rowPadding;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
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
            const BillionDivider(),
          ],
        ),
      ),
    );
  }
}
