import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:billionaire/src/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class SettingsArrow extends StatelessWidget {
  const SettingsArrow({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Assets.icons.arrowRight.svg(
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(
        colorScheme.onSurfaceVariant,
        BlendMode.srcIn,
      ),
    );
  }
}
