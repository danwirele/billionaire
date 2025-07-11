import 'package:billionaire/core/enum/localization_enum.dart';
import 'package:billionaire/core/enum/theme_enum.dart';
import 'package:billionaire/src/data/services/shared_preferences_service.dart';

abstract interface class SettingsLocalDatasource {
  Future<bool> saveTheme(ThemeEnum theme);

  Future<bool> saveLocalization(LocalizationEnum localization);

  Future<ThemeEnum> loadTheme();

  Future<LocalizationEnum> loadLocalization();
}

class SettingsLocalDatasourceImpl implements SettingsLocalDatasource {
  @override
  Future<bool> saveTheme(ThemeEnum theme) async {
    return SharedPreferencesService.prefs.setString(
      SharedPreferencesService.themeKey,
      theme.name,
    );
  }

  @override
  Future<bool> saveLocalization(LocalizationEnum localization) async {
    return SharedPreferencesService.prefs.setString(
      SharedPreferencesService.localizationKey,
      localization.name,
    );
  }

  @override
  Future<ThemeEnum> loadTheme() async {
    final String? theme = SharedPreferencesService.prefs.getString(
      SharedPreferencesService.themeKey,
    );

    if (theme != null) {
      return ThemeEnum.values.byName(theme);
    }

    return ThemeEnum.system;
  }

  @override
  Future<LocalizationEnum> loadLocalization() async {
    final String? localization = SharedPreferencesService.prefs.getString(SharedPreferencesService.localizationKey);

    if (localization != null) {
      LocalizationEnum.values.byName(localization);
    }

    return LocalizationEnum.system;
  }
}
