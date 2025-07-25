import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

Future<void> testExecutable(
  FutureOr<void> Function() testMain,
) async {
  return AlchemistConfig.runWithConfig(
    config:
        const AlchemistConfig(
          // forceUpdateGoldenFiles: true,
        ).copyWith(
          goldenTestTheme:
              GoldenTestTheme.standard().copyWith(
                    backgroundColor: Colors.white,
                  )
                  as GoldenTestTheme?,
        ),
    run: testMain,
  );
}
