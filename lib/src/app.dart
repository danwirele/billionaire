import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/data/services/dio_service.dart';
import 'package:billionaire/src/domain/controllers/categories_repository.dart';
import 'package:billionaire/src/presentation/shared/controllers/app_locale.dart';
import 'package:billionaire/src/presentation/shared/controllers/theme.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/blur_overlay.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/router/router.dart' show router;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App>
    with WidgetsBindingObserver {
  bool shouldBlur = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      shouldBlur =
          state == AppLifecycleState.inactive ||
          state == AppLifecycleState.paused;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.read(dioServiceProvider);
    ref.read(categoriesRepositoryProvider);

    ref.watch(appLocaleProvider);

    return ref
        .watch(themeProvider)
        .when(
          data: (themeState) {
            final theme = themeState.mode;
            final lightTintColor = themeState.lightTintColor;
            final darkTintColor = themeState.darkTintColor;

            return MaterialApp.router(
              builder: (context, child) {
                if (shouldBlur) {
                  return BlurOverlay(
                    child: child!,
                  );
                }

                return child!;
              },
              localizationsDelegates:
                  AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale('ru'),
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
