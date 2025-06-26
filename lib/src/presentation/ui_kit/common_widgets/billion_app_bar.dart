part of '../ui_kit.dart';

class BillionAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BillionAppBar({
    required this.title,
    super.key,
    this.actionIcon,
    this.leading,
    this.backgroundColor = BillionColors.primary,
  });

  @override
  Size get preferredSize => const Size.fromHeight(sizeAppBar);

  static const double sizeAppBar = 64.0;

  final String title;
  final Widget? leading;
  final Widget? actionIcon;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(title, style: BillionTextStyle.titleLarge),
      centerTitle: true,
      leading: leading,
      actionsPadding: const EdgeInsets.only(right: 4),
      actions: [?actionIcon],
    );
  }
}
