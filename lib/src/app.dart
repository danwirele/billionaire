import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/data/services/dio_service.dart';
import 'package:billionaire/src/domain/controllers/categories_repository.dart';
import 'package:billionaire/src/presentation/shared/controllers/app_locale.dart';
import 'package:billionaire/src/presentation/shared/controllers/theme.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/blur_overlay.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:billionaire/src/router/router.dart';
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

    final appLocaleFuture = ref.watch(appLocaleProvider.future);
    final themeFuture = ref.watch(themeProvider.future);
    final router = ref.read(routerProvider);

    return FutureBuilder(
      future: Future.wait([appLocaleFuture, themeFuture]),

      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData)
          return const Directionality(
            textDirection: TextDirection.ltr,
            child: CircularProgressIndicator(),
          );
        if (asyncSnapshot.hasError)
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              'Непредвиденная ошибка ${asyncSnapshot.error}',
            ),
          );

        final appLocale = asyncSnapshot.data![0] as Locale;
        final theme = asyncSnapshot.data![1] as ThemeState;

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
          locale: appLocale,
          routerConfig: router,
          theme: BillionTheme.lightTheme(
            primary: theme.lightTintColor,
          ),
          darkTheme: BillionTheme.darkTheme(
            primary: theme.darkTintColor,
          ),
          themeMode: theme.mode,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
