part of '../ui_kit.dart';

class NavBarWrapper extends StatelessWidget {
  const NavBarWrapper({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: child),
          const BillionBottomNavBar(),
        ],
      ),
    );
  }
}
