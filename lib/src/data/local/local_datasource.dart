import 'package:billionaire/core/enum/localization_enum.dart';
import 'package:billionaire/core/enum/theme_enum.dart';
import 'package:billionaire/src/data/utils/shared_preferences_service.dart';

class LocalDatasource {
  Future<bool> saveTheme(ThemeEnum theme) async {
    return SharedPreferencesService.prefs.setString(SharedPreferencesService.themeKey, theme.name);
  }

  Future<bool> saveLocalization(LocalizationEnum localization) async {
    return SharedPreferencesService.prefs.setString(SharedPreferencesService.localizationKey, localization.name);
  }

  Future<ThemeEnum> loadTheme() async {
    final String? theme = SharedPreferencesService.prefs.getString(SharedPreferencesService.themeKey);

    if (theme != null) {
      return ThemeEnum.values.byName(theme);
    }

    return ThemeEnum.system;
  }

  Future<LocalizationEnum> loadLocalization() async {
    final String? localization = SharedPreferencesService.prefs.getString(SharedPreferencesService.localizationKey);

    if (localization != null) {
      LocalizationEnum.values.byName(localization);
    }

    return LocalizationEnum.system;
  }
}
