import 'dart:async';
import 'dart:developer' show log;

import 'package:billionaire/src/app.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
      ImageUtils.svgPrecacheImage();
      runApp(const App());
    },
    (error, st) {
      log('call(runZoneGuarded) $error $st');
    },
  );
}
