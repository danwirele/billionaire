import 'package:billionaire/src/presentation/pages/account_page.dart';
import 'package:billionaire/src/presentation/pages/article_page.dart';
import 'package:billionaire/src/presentation/pages/expenses_page.dart';
import 'package:billionaire/src/presentation/pages/income_page.dart';
import 'package:billionaire/src/presentation/pages/settings_page.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/nav_bar_wrapper.dart';
import 'package:billionaire/src/router/routes_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RoutesUtil.accountPagePath,
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    ShellRoute(
      pageBuilder: (context, state, child) {
        return NoTransitionPage(child: NavBarWrapper(child: child));
      },
      routes: [
        GoRoute(
          path: RoutesUtil.incomePagePath,
          name: RoutesUtil.incomePageName,
          pageBuilder: (context, state) =>
              const MaterialPage(child: IncomePage()),
        ),
        GoRoute(
          path: RoutesUtil.accountPagePath,
          name: RoutesUtil.accountPageName,
          pageBuilder: (context, state) =>
              const MaterialPage(child: AccountPage()),
        ),
        GoRoute(
          path: RoutesUtil.expensesPagePath,
          name: RoutesUtil.expensesPageName,
          pageBuilder: (context, state) =>
              const MaterialPage(child: ExpensesPage()),
        ),
        GoRoute(
          path: RoutesUtil.articlePagePath,
          name: RoutesUtil.articlePageName,
          pageBuilder: (context, state) =>
              const MaterialPage(child: ArticlePage()),
        ),
        GoRoute(
          path: RoutesUtil.settingsPagePath,
          name: RoutesUtil.settingsPageName,
          pageBuilder: (context, state) =>
              const MaterialPage(child: SettingsPage()),
        ),
      ],
    ),
  ],
);
