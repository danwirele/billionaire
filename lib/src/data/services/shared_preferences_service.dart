import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_service.g.dart';

@Riverpod(keepAlive: true)
class SharedPrefeerncesSerivce extends _$SharedPrefeerncesSerivce {
  static const String themeKey = 'theme';
  static const String localizationKey = 'localization';

  @override
  FutureOr<SharedPreferences> build() async {
    return SharedPreferences.getInstance();
  }
}
