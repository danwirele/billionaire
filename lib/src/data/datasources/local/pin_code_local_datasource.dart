import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class PinCodeLocalDatasource {
  Future<void> savePinCode(String pinCode);
  Future<String?> loadPinCode();
  Future<bool> validatePinCode(String pinCode);
  Future<bool> passwordExists();
  Future<void> deletePassword(String pinCode);
  Future<void> setBiometricsLogin();
  Future<void> deleteBiometricsLogin();
  Future<bool> isBiometricsEnabled();
}

class PinCodeLocalDatasourceImpl implements PinCodeLocalDatasource {
  PinCodeLocalDatasourceImpl({required FlutterSecureStorage storage}) : _storage = storage;

  final FlutterSecureStorage _storage;
  static const String _pinCodeKey = 'pin_code';
  static const String _biometricsKey = 'biometrics';

  @override
  Future<void> savePinCode(String pinCode) async {
    if (pinCode.length != 4 || !RegExp(r'^\d{4}$').hasMatch(pinCode)) {
      throw ArgumentError('Пин-код должен состоять из 4 цифр');
    }
    await _storage.write(key: _pinCodeKey, value: pinCode);
  }

  @override
  Future<String?> loadPinCode() async {
    return _storage.read(key: _pinCodeKey);
  }

  @override
  Future<bool> validatePinCode(String pinCode) async {
    final savedPinCode = await _storage.read(key: _pinCodeKey);
    if (savedPinCode == null) {
      throw StateError('Ошибка');
    }
    return savedPinCode == pinCode;
  }

  @override
  Future<bool> passwordExists() async {
    return _storage.containsKey(key: _pinCodeKey);
  }

  @override
  Future<void> deletePassword(String pinCode) async {
    final passwordExists = await _storage.containsKey(
      key: _pinCodeKey,
    );
    if (!passwordExists) throw Exception('Невозможно удалить пароль');

    final isValid = await validatePinCode(pinCode);
    if (!isValid) throw Exception('Неверный пароль');

    await _storage.delete(key: _pinCodeKey);
  }

  @override
  Future<void> deleteBiometricsLogin() async {
    await _storage.delete(key: _biometricsKey);
  }

  @override
  Future<bool> isBiometricsEnabled() async {
    return _storage.containsKey(key: _biometricsKey);
  }

  @override
  Future<void> setBiometricsLogin() async {
    await _storage.write(key: _biometricsKey, value: 'enabled');
  }
}
