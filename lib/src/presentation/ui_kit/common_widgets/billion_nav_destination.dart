part of '../ui_kit.dart';

class BillionNavDestination extends StatelessWidget {
  const BillionNavDestination({
    required this.icon,
    required this.label,
    super.key,
  });

  final SvgGenImage icon;
  final String label;

  static const double _iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return NavigationDestination(
      label: label,
      icon: icon.svg(
        height: _iconSize,
        width: _iconSize,
        colorFilter: ColorFilter.mode(
          colorScheme.onSurfaceVariant,
          BlendMode.srcIn,
        ),
      ),
      selectedIcon: icon.svg(
        height: _iconSize,
        width: _iconSize,
        colorFilter: ColorFilter.mode(
          colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
