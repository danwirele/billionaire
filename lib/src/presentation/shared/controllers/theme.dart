import 'package:billionaire/src/data/datasources/local/settings_local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.freezed.dart';
//riverpod part
part 'theme.g.dart';

@Riverpod(keepAlive: true)
class Theme extends _$Theme {
  @override
  FutureOr<ThemeState> build() async {
    final settingsLocalDatasource = await ref.read(
      settingsLocalDatasourceImplDiProvider.future,
    );

    final theme = await settingsLocalDatasource.loadTheme();
    final lightTintColor = await settingsLocalDatasource
        .loadLightTintColor();
    final darkTintColor = await settingsLocalDatasource
        .loadDarkTintColor();

    return ThemeState(
      mode: theme,
      darkTintColor: darkTintColor,
      lightTintColor: lightTintColor,
    );
  }

  Future<void> toggleTheme() async {
    final settingsLocalDatasource = await ref.read(
      settingsLocalDatasourceImplDiProvider.future,
    );
    final currState = state.value!;

    final newMode = state.value!.mode == ThemeMode.light
        ? ThemeMode.system
        : ThemeMode.light;

    await settingsLocalDatasource.saveTheme(newMode);

    state = AsyncData(currState.copyWith(mode: newMode));
  }

  //USE! View.of(context).platformDispatcher.platformBrightness
  Future<void> setTint(Color color, Brightness brightness) async {
    final settingsLocalDatasource = await ref.read(
      settingsLocalDatasourceImplDiProvider.future,
    );
    final currState = state.value!;

    final isDarkMode =
        currState.mode == ThemeMode.dark ||
        (currState.mode == ThemeMode.system &&
            brightness == Brightness.dark);

    if (isDarkMode) {
      await settingsLocalDatasource.saveDarkTintColor(color);
      state = AsyncData(currState.copyWith(darkTintColor: color));
    } else {
      await settingsLocalDatasource.saveLightTintColor(color);
      state = AsyncData(currState.copyWith(lightTintColor: color));
    }
  }
}

@freezed
abstract class ThemeState with _$ThemeState {
  factory ThemeState({
    required ThemeMode mode,
    Color? lightTintColor,
    Color? darkTintColor,
  }) = _ThemeState;
}
