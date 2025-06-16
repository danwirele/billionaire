part of '../ui_kit.dart';

class BillionAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BillionAppBar({
    super.key,
    required this.title,
    this.actionIcon,
    this.leading,
  });

  @override
  Size get preferredSize => Size.fromHeight(sizeAppBar);

  static const double sizeAppBar = 64.0;

  final String title;
  final Widget? leading;
  final Widget? actionIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BillionColors.primary,
      title: Text(title, style: BillionTextStyle.titleLarge),
      centerTitle: true,
      leading: leading,
      actionsPadding: EdgeInsets.only(right: 16),
      actions: [?actionIcon],
    );
  }
}
