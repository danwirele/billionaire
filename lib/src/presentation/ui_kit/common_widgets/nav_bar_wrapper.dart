import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class NavBarWrapper extends StatelessWidget {
  const NavBarWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: child),
          BillionBottomNavBar(),
        ],
      ),
    );
  }
}
