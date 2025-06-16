part of '../ui_kit.dart';

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
