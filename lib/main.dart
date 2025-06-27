import 'dart:async';
import 'dart:developer' show log;

import 'package:billionaire/src/app.dart';
import 'package:billionaire/src/data/db/db.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/image_utils.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late Database database;

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
      ImageUtils.svgPrecacheImage();

      database = Database(NativeDatabase.memory());

      runApp(const App());
    },
    (error, st) {
      log('call(runZoneGuarded) $error $st');
    },
  );
}
