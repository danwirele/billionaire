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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ConnectionContainer(),
        MediaQuery.removePadding(
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
        ),
      ],
    );
  }
}

class ConnectionContainer extends ConsumerStatefulWidget {
  const ConnectionContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConnectionContainerState();
}

class _ConnectionContainerState
    extends ConsumerState<ConnectionContainer>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ref
        .watch(connectionProvider)
        .when(
          data: (data) {
            return AnimatedContainer(
              height: !data ? 36 : 0,
              key: const ValueKey('offline-bar'),
              width: double.infinity,
              duration: Durations.medium4,
              color: BillionColors.error,
              alignment: Alignment.center,
              child: BillionText.bodyLarge(
                'Offline mode',
                color: BillionColors.onPrimary,
              ),
            );
          },
          error: (error, stackTrace) => SizedBox.shrink(),
          loading: () => SizedBox.shrink(),
          skipLoadingOnRefresh: true,
          skipError: true,
          skipLoadingOnReload: true,
        );
  }
}
