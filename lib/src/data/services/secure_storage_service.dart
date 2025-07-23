import 'package:billionaire/src/data/datasources/local/pin_code_local_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_service.g.dart';

@Riverpod(keepAlive: true)
class PincodeService extends _$PincodeService {
  @override
  PinCodeLocalDatasource build() {
    const secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
        storageCipherAlgorithm: StorageCipherAlgorithm.AES_CBC_PKCS7Padding,
        keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_PKCS1Padding,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.passcode,
      ),
    );

    return PinCodeLocalDatasourceImpl(storage: secureStorage);
  }
}
