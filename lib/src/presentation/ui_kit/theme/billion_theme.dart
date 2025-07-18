part of '../ui_kit.dart';

class BillionTheme extends ColorScheme {
  const BillionTheme.light(this.newPrimary)
    : super.light(
        primary: newPrimary,
        onPrimary: BillionColors.lightOnPrimary,
        primaryContainer: BillionColors.lightPrimaryContainer,
        surface: BillionColors.lightSurface,
        onSurface: BillionColors.lightOnSurface,
        onSurfaceVariant: BillionColors.lightOnSurfaceVariant,
        surfaceContainer: BillionColors.lightSurfaceContainer,
        surfaceContainerHigh: BillionColors.lightSurfaceContainerHigh,
        tertiary: BillionColors.lightTertiary,
        outlineVariant: BillionColors.lightOutlineVariant,
        error: BillionColors.lightError,
      );

  const BillionTheme.dark(this.newPrimary)
    : super.dark(
        primary: newPrimary,
        onPrimary: BillionColors.darkOnPrimary,
        primaryContainer: BillionColors.darkPrimaryContainer,
        surface: BillionColors.darkSurface,
        onSurface: BillionColors.darkOnSurface,
        onSurfaceVariant: BillionColors.darkOnSurfaceVariant,
        surfaceContainer: BillionColors.darkSurfaceContainer,
        surfaceContainerHigh: BillionColors.darkSurfaceContainerHigh,
        tertiary: BillionColors.darkTertiary,
        outlineVariant: BillionColors.darkOutlineVariant,
        error: BillionColors.darkError,
      );

  final Color newPrimary;

  static ThemeData lightTheme({required Color? primary}) {
    return ThemeData(
      colorScheme: BillionTheme.light(
        primary ?? BillionColors.lightPrimary,
      ),
      textTheme: _buildTextTheme(
        BillionColors.lightOnSurface,
        BillionColors.lightOnSurfaceVariant,
      ),
      useMaterial3: true, // Enable Material 3 design
    );
  }

  static ThemeData darkTheme({required Color? primary}) => ThemeData(
    colorScheme: BillionTheme.dark(
      primary ?? BillionColors.darkPrimary,
    ),
    textTheme: _buildTextTheme(
      BillionColors.darkOnSurface,
      BillionColors.darkOnSurfaceVariant,
    ),
    useMaterial3: true, // Enable Material 3 design
  );

  static TextTheme _buildTextTheme(
    Color onSurface,
    Color onSurfaceVariant,
  ) {
    return TextTheme(
      titleLarge: BillionTextStyle.titleLarge.copyWith(
        color: onSurface,
      ),
      titleMedium: BillionTextStyle.titleMedium.copyWith(
        color: onSurface,
      ),
      labelMedium: BillionTextStyle.labelMedium.copyWith(
        color: onSurfaceVariant,
      ),
      labelLarge: BillionTextStyle.labelLarge.copyWith(
        color: onSurfaceVariant,
      ),
      bodyLarge: BillionTextStyle.bodyLarge.copyWith(
        color: onSurface,
      ),
      bodyMedium: BillionTextStyle.bodyMedium.copyWith(
        color: onSurfaceVariant,
      ),
    );
  }
}

extension BillionThemeExtention on BuildContext {
  ThemeData? get theme => Theme.of(this);

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
