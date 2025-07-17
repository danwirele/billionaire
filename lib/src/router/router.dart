import 'package:billionaire/src/presentation/pages/account/account_page.dart';
import 'package:billionaire/src/presentation/pages/auth/auth_page.dart';
import 'package:billionaire/src/presentation/pages/auth/pincode_page.dart';
import 'package:billionaire/src/presentation/pages/settings/settings_page.dart';
import 'package:billionaire/src/presentation/pages/stats/stats_page.dart';
import 'package:billionaire/src/presentation/pages/transaction/analysis/analysis_page.dart';
import 'package:billionaire/src/presentation/pages/transaction/expenses/expenses_page.dart';
import 'package:billionaire/src/presentation/pages/transaction/history/history_page.dart';
import 'package:billionaire/src/presentation/pages/transaction/income/income_page.dart';
import 'package:billionaire/src/presentation/shared/controllers/auth.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellRouteNavigtorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

@Riverpod(keepAlive: true)
class Router extends _$Router {
  @override
  GoRouter build() {
    final isAuth = ValueNotifier(false);

    ref
      ..onDispose(isAuth.dispose)
      ..listen(
        authProvider,
        (previous, next) {
          if (next is AsyncData && next.value != null) {
            isAuth.value = next.value!;
          }
        },
      );

    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: RoutesUtil.accountPagePath,
      navigatorKey: _rootNavigatorKey,
      redirect: (context, state) {
        if (!isAuth.value) {
          return RoutesUtil.authPagePath;
        }

        return null;
      },
      routes: <RouteBase>[
        ShellRoute(
          navigatorKey: _shellRouteNavigtorKey,
          pageBuilder: (context, state, child) {
            return NoTransitionPage(
              child: NavBarWrapper(child: child),
            );
          },
          routes: [
            GoRoute(
              path: RoutesUtil.analysisPagePath,
              name: RoutesUtil.analysisPageName,
              builder: (context, state) {
                final isIncome =
                    state.pathParameters['isIncome'] == 'true';

                if (isIncome) {
                  return const AnalysisPage.income();
                }

                return const AnalysisPage.expense();
              },
            ),
            GoRoute(
              path: RoutesUtil.historyPagePath,
              name: RoutesUtil.historyPageName,
              builder: (context, state) {
                final isIncome =
                    state.pathParameters['isIncome'] == 'true';

                if (isIncome) {
                  return const HistoryPage.income();
                }

                return const HistoryPage.expense();
              },
            ),
            GoRoute(
              path: RoutesUtil.incomePagePath,
              name: RoutesUtil.incomePageName,
              pageBuilder: (_, _) =>
                  const MaterialPage(child: IncomePage()),
            ),
            GoRoute(
              path: RoutesUtil.accountPagePath,
              name: RoutesUtil.accountPageName,
              pageBuilder: (_, _) =>
                  const MaterialPage(child: AccountPage()),
            ),
            GoRoute(
              path: RoutesUtil.expensesPagePath,
              name: RoutesUtil.expensesPageName,
              pageBuilder: (_, _) =>
                  const MaterialPage(child: ExpensesPage()),
            ),
            GoRoute(
              path: RoutesUtil.statsPagePath,
              name: RoutesUtil.statsPageName,
              pageBuilder: (_, _) =>
                  const MaterialPage(child: StatsPage()),
            ),
            GoRoute(
              path: RoutesUtil.settingsPagePath,
              name: RoutesUtil.settingsPageName,
              pageBuilder: (_, _) =>
                  const MaterialPage(child: SettingsPage()),
            ),
          ],
        ),
        GoRoute(
          path: RoutesUtil.authPagePath,
          name: RoutesUtil.authPageName,
          builder: (context, state) {
            return const AuthPage();
          },
        ),
        GoRoute(
          path: RoutesUtil.pincodePagePath,
          name: RoutesUtil.pincodePageName,
          builder: (context, state) {
            return const PincodePage();
          },
        ),
      ],
    );
  }
}
