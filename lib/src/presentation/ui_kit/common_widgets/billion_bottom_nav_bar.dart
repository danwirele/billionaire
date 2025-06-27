part of '../ui_kit.dart';

class BillionBottomNavBar extends StatefulWidget {
  const BillionBottomNavBar({super.key});

  @override
  State<BillionBottomNavBar> createState() =>
      _BillionBottomNavBarState();
}

class _BillionBottomNavBarState extends State<BillionBottomNavBar> {
  static const double _navBarHeight = 80.0;

  static int _index = 2;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: NavigationBar(
        height: _navBarHeight,
        backgroundColor: BillionColors.surfaceContainer,
        indicatorColor: BillionColors.primaryContainer,
        overlayColor: const WidgetStatePropertyAll(
          Colors.transparent,
        ),
        animationDuration: const Duration(seconds: 1),
        selectedIndex: _index,
        labelTextStyle: WidgetStateTextStyle.resolveWith(
          (Set<WidgetState> states) =>
              BillionTextStyle.labelMedium.copyWith(
                color: states.contains(WidgetState.selected)
                    ? null
                    : BillionColors.onSurfaceVariant,
              ),
        ),
        onDestinationSelected: (value) {
          switch (value) {
            case 0:
              setState(() => _index = value);
              context.goNamed(RoutesUtil.expensesPageName);
            case 1:
              setState(() => _index = value);
              context.goNamed(RoutesUtil.incomePageName);
            case 2:
              setState(() => _index = value);
              context.goNamed(RoutesUtil.accountPageName);
            case 3:
              setState(() => _index = value);
              context.goNamed(RoutesUtil.statsPageName);
            case 4:
              setState(() => _index = value);
              context.goNamed(RoutesUtil.settingsPageName);
          }
        },
        destinations: [
          BillionNavDestination(
            icon: Assets.icons.trendDown,
            label: AppLocalizations.of(context)!.navBarExpenses,
          ),
          BillionNavDestination(
            icon: Assets.icons.trendUp,
            label: AppLocalizations.of(context)!.navBarIncome,
          ),
          BillionNavDestination(
            icon: Assets.icons.account,
            label: AppLocalizations.of(context)!.navBarAccount,
          ),
          BillionNavDestination(
            icon: Assets.icons.expenseStats,
            label: AppLocalizations.of(context)!.navBarStats,
          ),
          BillionNavDestination(
            icon: Assets.icons.settings,
            label: AppLocalizations.of(context)!.navBarSettings,
          ),
        ],
      ),
    );
  }
}
