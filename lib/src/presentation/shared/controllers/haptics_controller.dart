import 'package:billionaire/src/data/datasources/local/settings_local_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibration/vibration.dart';

part 'haptics_controller.g.dart';

@Riverpod(keepAlive: true)
class HaptickController extends _$HaptickController {
  late SettingsLocalDatasource _settingsDataSource;

  @override
  Future<bool> build() async {
    final settingsDataSource = await ref.read(
      settingsLocalDatasourceImplDiProvider.future,
    );
    _settingsDataSource = settingsDataSource;

    final isEnabled = await _settingsDataSource.loadHapticsEnabled();
    return isEnabled;
  }

  Future<void> setHapticsEnabled({required bool isEnabled}) async {
    await _settingsDataSource.saveHapticsEnabled(
      isEnabled: isEnabled,
    );
    state = AsyncData(isEnabled);
  }

  Future<void> triggerLightHaptic() async {
    if (await Vibration.hasCustomVibrationsSupport()) {
      await Vibration.vibrate(
        pattern: [0, 50],
        intensities: [0, 7],
      );
    }
  }

  Future<void> triggerErrorHaptic() async {
    if (await Vibration.hasCustomVibrationsSupport()) {
      await Vibration.vibrate(
        pattern: [0, 100],
        intensities: [0, 12],
      );
    }
  }

  Future<void> triggerSuccessHaptic() async {
    if (await Vibration.hasCustomVibrationsSupport()) {
      await Vibration.vibrate(
        pattern: [0, 30, 50, 30],
        intensities: [0, 5, 0, 5],
      );
    }
  }
}
