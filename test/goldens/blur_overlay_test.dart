import 'dart:ui' as ui;

import 'package:alchemist/alchemist.dart';
import 'package:billionaire/core/l10n/app_localizations.dart';
import 'package:billionaire/src/presentation/ui_kit/common_widgets/blur_overlay.dart';
import 'package:flutter/material.dart';

void main() {
  goldenTest(
    'BlurOverlay widget',
    fileName: 'blur_overlay',
    builder: () => Material(
      color: Colors.white,
      child: Localizations(
        locale: const ui.Locale('en', 'US'),
        delegates: AppLocalizations.localizationsDelegates,
        child: GoldenTestGroup(
          children: [
            GoldenTestScenario(
              name: 'Without child',
              child: const BlurOverlay(),
            ),

            GoldenTestScenario(
              name: 'With child',
              child: const BlurOverlay(
                backgroundChild: Text('Test'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
