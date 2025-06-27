import 'dart:async';
import 'dart:developer' show log;
import 'dart:io';

import 'package:billionaire/src/app.dart';
import 'package:billionaire/src/data/db/db.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/image_utils.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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

      final appDir = await getApplicationDocumentsDirectory();
      final dbPath = '${appDir.path}/dogs.db';
      final dbFile = File(dbPath);

      final dbConnection = NativeDatabase.createBackgroundConnection(
        dbFile,
      );
      database = Database(dbConnection);

      runApp(const App());
    },
    (error, st) {
      log('call(runZoneGuarded) $error $st');
    },
  );
}
