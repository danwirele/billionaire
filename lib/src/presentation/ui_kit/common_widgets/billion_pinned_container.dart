part of '../ui_kit.dart';

class BillionPinnedContainer extends StatelessWidget {
  const BillionPinnedContainer.primaryMedium({
    required this.leading,
    required this.action,
    super.key,
    this.onTap,
    this.isTransaprent = false,
  }) : _height = 56,
       _rowPadding = const EdgeInsets.symmetric(
         horizontal: 16,
       );

  const BillionPinnedContainer.primaryLarge({
    required this.leading,
    required this.action,
    super.key,
    this.onTap,
    this.isTransaprent = false,
  }) : _height = 70,
       _rowPadding = const EdgeInsets.symmetric(
         horizontal: 16,
       );

  const BillionPinnedContainer.transparentMedium({
    required this.leading,
    required this.action,
    super.key,
    this.onTap,
    this.isTransaprent = true,
  }) : _height = 56,
       _rowPadding = const EdgeInsets.symmetric(
         horizontal: 16,
       );

  const BillionPinnedContainer.transparentLarge({
    required this.leading,
    required this.action,
    super.key,
    this.onTap,
    this.isTransaprent = true,
  }) : _height = 70,
       _rowPadding = const EdgeInsets.symmetric(
         horizontal: 16,
       );

  final Widget leading;
  final Widget action;
  final void Function()? onTap;
  final EdgeInsets _rowPadding;
  final bool isTransaprent;
  final double _height;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Material(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: _height,
              padding: _rowPadding,
              color: isTransaprent
                  ? Colors.transparent
                  : colorScheme.primaryContainer,
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
