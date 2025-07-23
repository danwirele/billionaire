import 'package:billionaire/src/data/services/secure_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  //ЕСЛИ ПАРОЛЯ НЕТ ТО ВСЕГДА TRUE
  //ЕСЛИ ПАРОЛЬ НЕТ ТО ИЗНАЧАЛЬНО ТУТ FALSE
  @override
  FutureOr<bool> build() async {
    final pincodeDatasource = ref.read(pincodeServiceProvider);
    final passwordExists = await pincodeDatasource.passwordExists();
    return !passwordExists;
  }

  //ДЛЯ ТОГО ЧТО БЫ ВХОДИТЬ
  Future<void> logIn({required String pinCode}) async {
    final pincodeDatasource = ref.read(pincodeServiceProvider);

    await pincodeDatasource.validatePinCode(pinCode);
  }

  //ЧТО БЫ УСТАНОВИТЬ
  Future<void> setPass({required String pinCode}) async {
    final pincodeDatasource = ref.read(pincodeServiceProvider);

    await pincodeDatasource.savePinCode(pinCode);
  }

  //ПРОСТО ПРОВЕРИТЬ ЧТО ЮЗЕР ЗНАЕТ ТЕКУЩИЙ ПАРОЛЬ
  Future<bool> validatePincode({required String pinCode}) async {
    final pincodeDatasource = ref.read(pincodeServiceProvider);

    final isSucces = await pincodeDatasource.validatePinCode(pinCode);
    state = AsyncData(isSucces);
    return isSucces;
  }

  //ПРОСТО ПРОВЕРИТЬ ЧТО У ЮЗЕРА ЕСТЬ ПАРОЛЬ
  Future<bool> hasPassword() async {
    final pincodeDatasource = ref.read(pincodeServiceProvider);

    return pincodeDatasource.passwordExists();
  }

  //ЗАЧИЩАЕМ
  Future<void> deletePass(String pinCode) async {
    final pincodeDatasource = ref.read(pincodeServiceProvider);

    await pincodeDatasource.deletePassword(pinCode);
  }

  Future<void> biometricsLogIn() async {
    state = const AsyncData(true);
    return;
  }

  Future<void> deleteBiometricsLogin() async {
    await ref.read(pincodeServiceProvider).deleteBiometricsLogin();
  }

  Future<void> setBiometricsLogin() async {
    return ref.read(pincodeServiceProvider).setBiometricsLogin();
  }

  Future<bool> isBiometricsEnabled() async {
    return ref.read(pincodeServiceProvider).isBiometricsEnabled();
  }
}
