import 'dart:async';
import 'dart:developer' show log;

import 'package:billionaire/core/config/config.dart';
import 'package:billionaire/src/app.dart';
import 'package:billionaire/src/presentation/ui_kit/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:worker_manager/worker_manager.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
      await SystemChrome.setApplicationSwitcherDescription(
        const ApplicationSwitcherDescription(
          label: 'My App',
          primaryColor: 1,
        ),
      );
      ImageUtils.svgPrecacheImage();

      await Config().init();

      workerManager.log = true;
      // await workerManager.init();
      runApp(const ProviderScope(child: App()));
    },
    (error, st) {
      log('call(runZoneGuarded) $error $st', level: 2000);
    },
  );
}
