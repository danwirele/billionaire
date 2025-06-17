import 'dart:async';
import 'dart:developer' show log;

import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageUtils {
  static void svgPrecacheImage() {
    final cacheSvgImages = Assets.icons.values
        .map((e) => e.path)
        .toList();

    for (final String element in cacheSvgImages) {
      final loader = SvgAssetLoader(element);
      svg.cache.putIfAbsent(
        loader.cacheKey(null),
        () => loader.loadBytes(null),
      );
    }
  }
}

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
