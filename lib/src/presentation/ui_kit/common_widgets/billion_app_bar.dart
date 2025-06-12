import 'package:billionaire/src/presentation/ui_kit/theme/billion_colors.dart';
import 'package:billionaire/src/presentation/ui_kit/theme/billion_text_style.dart';
import 'package:flutter/material.dart';

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
      actionsPadding: EdgeInsets.only(right: 4),
      actions: [?actionIcon],
    );
  }
}
