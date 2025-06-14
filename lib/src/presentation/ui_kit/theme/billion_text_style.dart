import 'package:billionaire/src/presentation/ui_kit/theme/billion_colors.dart';
import 'package:flutter/material.dart';

class BillionTextStyle {
  static const titleLarge = TextStyle(
    fontSize: 22,
    height: 28 / 22,
    color: BillionColors.onSurface,
    fontWeight: FontWeight.normal,
  );

  static const labelMedium = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    color: BillionColors.onSurface,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
}
