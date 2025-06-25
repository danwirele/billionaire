import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences prefs;

  static const String themeKey = 'theme';
  static const String localizationKey = 'localization';

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
