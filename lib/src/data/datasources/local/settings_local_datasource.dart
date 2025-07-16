import 'package:billionaire/core/enum/localization_enum.dart';
import 'package:billionaire/src/data/services/shared_preferences_service.dart';
import 'package:flutter/material.dart' show Color, ThemeMode;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_local_datasource.g.dart';

abstract interface class SettingsLocalDatasource {
  Future<bool> saveTheme(ThemeMode theme);

  Future<bool> saveLocalization(LocalizationEnum localization);

  Future<ThemeMode> loadTheme();

  Future<LocalizationEnum> loadLocalization();

  Future<bool> saveLightTintColor(Color color);

  Future<bool> saveDarkTintColor(Color color);

  Future<Color?> loadLightTintColor();

  Future<Color?> loadDarkTintColor();
}

@Riverpod(keepAlive: true)
class SettingsLocalDatasourceImplDi
    extends _$SettingsLocalDatasourceImplDi {
  @override
  FutureOr<SettingsLocalDatasourceImpl> build() async {
    final sharedPreferencesProvider = await ref.read(
      sharedPreferencesServiceProvider.future,
    );

    return SettingsLocalDatasourceImpl(
      sharedPrefeernces: sharedPreferencesProvider,
    );
  }
}

class SettingsLocalDatasourceImpl implements SettingsLocalDatasource {
  SettingsLocalDatasourceImpl({
    required SharedPreferences sharedPrefeernces,
  }) : _sharedPreferernces = sharedPrefeernces;

  final SharedPreferences _sharedPreferernces;

  @override
  Future<bool> saveTheme(ThemeMode theme) async {
    return _sharedPreferernces.setString(
      SharedPreferencesService.themeKey,
      theme.name,
    );
  }

  @override
  Future<bool> saveLocalization(LocalizationEnum localization) async {
    return _sharedPreferernces.setString(
      SharedPreferencesService.localizationKey,
      localization.name,
    );
  }

  @override
  Future<ThemeMode> loadTheme() async {
    final String? theme = _sharedPreferernces.getString(
      SharedPreferencesService.themeKey,
    );

    if (theme != null) {
      return ThemeMode.values.byName(theme);
    }

    return ThemeMode.light;
  }

  @override
  Future<LocalizationEnum> loadLocalization() async {
    final String? localization = _sharedPreferernces.getString(
      SharedPreferencesService.localizationKey,
    );

    if (localization != null) {
      LocalizationEnum.values.byName(localization);
    }

    return LocalizationEnum.system;
  }

  @override
  Future<bool> saveLightTintColor(Color color) async {
    return _sharedPreferernces.setString(
      SharedPreferencesService.lightTintColorKey,
      '#${color.value.toRadixString(16).padLeft(8, '0')}',
    );
  }

  @override
  Future<bool> saveDarkTintColor(Color color) async {
    return _sharedPreferernces.setString(
      SharedPreferencesService.darkTintColorKey,
      '#${color.value.toRadixString(16).padLeft(8, '0')}',
    );
  }

  @override
  Future<Color?> loadLightTintColor() async {
    final String? hexColor = _sharedPreferernces.getString(
      SharedPreferencesService.lightTintColorKey,
    );
    if (hexColor != null) {
      return Color(int.parse(hexColor.substring(1), radix: 16));
    }
    return null; // Default color
  }

  @override
  Future<Color?> loadDarkTintColor() async {
    final String? hexColor = _sharedPreferernces.getString(
      SharedPreferencesService.darkTintColorKey,
    );
    if (hexColor != null) {
      return Color(int.parse(hexColor.substring(1), radix: 16));
    }
    return null; // Default color
  }
}
