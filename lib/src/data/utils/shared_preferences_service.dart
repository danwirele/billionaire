import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences prefs;

  static const String themeKey = 'theme';
  static const String localizationKey = 'localization';
  static const String lightTintColorKey = 'light_tint_color';
  static const String darkTintColorKey = 'dark_tint_color';

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
