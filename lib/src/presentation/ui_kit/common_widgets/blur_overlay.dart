import 'dart:ui' show ImageFilter;

import 'package:billionaire/src/presentation/ui_kit/utils/localization_extension.dart';
import 'package:flutter/material.dart';

class BlurOverlay extends StatelessWidget {
  const BlurOverlay({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        child: Stack(
          children: [
            child,
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10.0,
                sigmaY: 10.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.1),
                ),
              ),
            ),
            Center(
              child: Text(
                context.localization.dontSteal,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
