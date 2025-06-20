import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/router/router.dart' show router;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        localizationsDelegates:
            AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('ru', 'RU'),
        routerConfig: router,
        theme: ThemeData.light(useMaterial3: true),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
