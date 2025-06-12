import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/billion_nav_destination.dart';
import 'package:billionaire/src/presentation/ui_kit/theme/billion_colors.dart';
import 'package:billionaire/src/presentation/ui_kit/theme/billion_text_style.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        indicatorColor: BillionColors.onPrimary,
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        animationDuration: Duration(seconds: 1),
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
              context.goNamed(RoutesUtil.expensesPageName);
              _index = value;
            case 1:
              context.goNamed(RoutesUtil.incomePageName);
              _index = value;
            case 2:
              context.goNamed(RoutesUtil.accountPageName);
              _index = value;
            case 3:
              context.goNamed(RoutesUtil.articlePageName);
              _index = value;
            case 4:
              context.goNamed(RoutesUtil.settingsPageName);
              _index = value;
          }
        },
        destinations: [
          BillionNavDestination(
            iconPath: Assets.icons.trendDown.path,
            label: AppLocalizations.of(context)!.navBarExpenses,
          ),
          BillionNavDestination(
            iconPath: Assets.icons.trendUp.path,
            label: AppLocalizations.of(context)!.navBarIncome,
          ),
          BillionNavDestination(
            iconPath: Assets.icons.account.path,
            label: AppLocalizations.of(context)!.navBarAccount,
          ),
          BillionNavDestination(
            iconPath: Assets.icons.expenseArticles.path,
            label: AppLocalizations.of(context)!.navBarStats,
          ),
          BillionNavDestination(
            iconPath: Assets.icons.settings.path,
            label: AppLocalizations.of(context)!.navBarSettings,
          ),
        ],
      ),
    );
  }
}
