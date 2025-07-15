part of '../ui_kit.dart';

class BillionBottomNavBar extends StatefulWidget {
  const BillionBottomNavBar({super.key});

  @override
  State<BillionBottomNavBar> createState() => _BillionBottomNavBarState();
}

class _BillionBottomNavBarState extends State<BillionBottomNavBar> {
  static const double _navBarHeight = 80.0;

  static int _index = 2;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final localization = context.localization;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ConnectionContainer(),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: NavigationBar(
            height: _navBarHeight,
            backgroundColor: colorScheme.surfaceContainer,
            indicatorColor: colorScheme.primaryContainer,
            overlayColor: const WidgetStatePropertyAll(
              Colors.transparent,
            ),
            animationDuration: const Duration(seconds: 1),
            selectedIndex: _index,
            labelTextStyle: WidgetStateTextStyle.resolveWith(
              (Set<WidgetState> states) => BillionTextStyle.labelMedium.copyWith(
                color: states.contains(WidgetState.selected) ? null : colorScheme.onSurfaceVariant,
              ),
            ),
            onDestinationSelected: (value) async {
              if (await Vibration.hasCustomVibrationsSupport()) {
                Vibration.vibrate(
                  pattern: [0, 50],
                  intensities: [0, 7],
                );
              }
              if (!context.mounted) return;

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
                label: localization.navBarExpenses,
              ),
              BillionNavDestination(
                icon: Assets.icons.trendUp,
                label: localization.navBarIncome,
              ),
              BillionNavDestination(
                icon: Assets.icons.account,
                label: localization.navBarAccount,
              ),
              BillionNavDestination(
                icon: Assets.icons.expenseStats,
                label: localization.navBarStats,
              ),
              BillionNavDestination(
                icon: Assets.icons.settings,
                label: localization.navBarSettings,
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
  ConsumerState<ConsumerStatefulWidget> createState() => _ConnectionContainerState();
}

class _ConnectionContainerState extends ConsumerState<ConnectionContainer> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return ref
        .watch(connectionProvider)
        .when(
          data: (data) {
            return AnimatedContainer(
              height: !data ? 36 : 0,
              key: const ValueKey('offline-bar'),
              width: double.infinity,
              duration: Durations.medium4,
              color: colorScheme.error,
              alignment: Alignment.center,
              child: BillionText.bodyLarge(
                'Offline mode',
                color: colorScheme.onPrimary,
              ),
            );
          },
          error: (error, stackTrace) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
          skipLoadingOnRefresh: true,
          skipError: true,
          skipLoadingOnReload: true,
        );
  }
}
