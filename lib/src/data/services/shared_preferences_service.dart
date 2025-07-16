import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_service.g.dart';

@Riverpod(keepAlive: true)
class SharedPreferencesService extends _$SharedPreferencesService {
  static const String themeKey = 'theme';
  static const String localizationKey = 'localization';
  static const String lightTintColorKey = 'light_tint_color';
  static const String darkTintColorKey = 'dark_tint_color';
  @override
  FutureOr<SharedPreferences> build() async {
    return SharedPreferences.getInstance();
  }
}
