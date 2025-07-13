import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/data/services/dio_service.dart';
import 'package:billionaire/src/presentation/shared/controllers/theme.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/router/router.dart' show router;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(dioServiceProvider);

    return ref
        .watch(themeProvider)
        .when(
          data: (themeState) {
            final theme = themeState.mode;
            final lightTintColor = themeState.lightTintColor;
            final darkTintColor = themeState.darkTintColor;

            return MaterialApp.router(
              localizationsDelegates:
                  AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: const Locale('ru', 'RU'),
              routerConfig: router,
              theme: BillionTheme.lightTheme(primary: lightTintColor),
              darkTheme: BillionTheme.darkTheme(
                primary: darkTintColor,
              ),
              themeMode: theme,
              debugShowCheckedModeBanner: false,
            );
          },
          skipError: true,
          skipLoadingOnRefresh: true,
          skipLoadingOnReload: true,
          error: (error, stackTrace) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
        );
  }
}
