import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'secure_storage_service.g.dart';

@Riverpod(keepAlive: true)
class SecureStorageService extends _$SecureStorageService {
  @override
  FlutterSecureStorage build() {
    return FlutterSecureStorage();
  }
}
