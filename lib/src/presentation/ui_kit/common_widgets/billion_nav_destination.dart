part of '../ui_kit.dart';

class BillionNavDestination extends StatelessWidget {
  const BillionNavDestination({
    required this.icon,
    required this.label,
    super.key,
  });

  final SvgGenImage icon;
  final String label;

  static const _unselectedColorFilter = ColorFilter.mode(
    BillionColors.onSurfaceVariant,
    BlendMode.srcIn,
  );

  static const _selectedColorFilter = ColorFilter.mode(
    BillionColors.primary,
    BlendMode.srcIn,
  );

  static const double _iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      label: label,
      icon: icon.svg(
        height: _iconSize,
        width: _iconSize,
        colorFilter: _unselectedColorFilter,
      ),
      selectedIcon: icon.svg(
        height: _iconSize,
        width: _iconSize,
        colorFilter: _selectedColorFilter,
      ),
    );
  }
}
