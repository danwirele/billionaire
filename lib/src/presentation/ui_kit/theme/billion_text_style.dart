import 'package:billionaire/src/presentation/ui_kit/theme/billion_colors.dart';
import 'package:flutter/material.dart';

class BillionTextStyle {
  static const titleLarge = TextStyle(
    fontSize: 22,
    height: 28 / 22,
    color: BillionColors.onSurface,
    fontWeight: FontWeight.w400,
  );

  static const labelMedium = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    color: BillionColors.onSurface,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static const bodyLarge = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    color: BillionColors.onSurface,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    color: BillionColors.onSurfaceVariant,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
}
