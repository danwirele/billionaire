import 'dart:async';
import 'dart:developer' show log;

import 'package:billionaire/src/app.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
      ImageUtils.svgPrecacheImage();
      await dotenv.load();
      final String apiKey = dotenv.env['BEARER']!;
      final String baseUrl = dotenv.env['BASE_URL']!;

      runApp(ProviderScope(child: const App()));
    },
    (error, st) {
      log('call(runZoneGuarded) $error $st');
    },
  );
}
