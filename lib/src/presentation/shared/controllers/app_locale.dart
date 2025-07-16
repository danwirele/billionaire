import 'package:billionaire/core/enum/localization_enum.dart';
import 'package:billionaire/src/data/datasources/local/settings_local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_locale.g.dart';

@Riverpod(keepAlive: true)
class AppLocale extends _$AppLocale {
  late SettingsLocalDatasource _settingsDataSource;

  @override
  Future<Locale> build() async {
    // Получаем datasource через DI
    final settingsDataSource = await ref.read(
      settingsLocalDatasourceImplDiProvider.future,
    );
    _settingsDataSource = settingsDataSource;

    final localization = await _settingsDataSource.loadLocalization();
    return localeFromEnum(localization);
  }

  Locale localeFromEnum(LocalizationEnum enumValue) {
    switch (enumValue) {
      case LocalizationEnum.ru:
        return const Locale('ru');
      case LocalizationEnum.en:
        return const Locale('en');
      case LocalizationEnum.system:
        return WidgetsBinding.instance.window.locale;
    }
  }

  Future<void> updateLocale(LocalizationEnum enumValue) async {
    final locale = localeFromEnum(enumValue);

    await _settingsDataSource.saveLocalization(enumValue);

    state = AsyncData(locale);
  }

  Future<void> resetToSystemLocale() async {
    await _settingsDataSource.saveLocalization(
      LocalizationEnum.system,
    );

    state = AsyncData(WidgetsBinding.instance.window.locale);
  }
}
