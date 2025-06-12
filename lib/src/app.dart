import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/router/router.dart' show router;
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // locale: Locale('en', 'US'),
      locale: Locale('ru', 'RU'),
      routerConfig: router,
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}
