import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  SecureStorageService._privateConstructor();

  static SecureStorageService? _instance;

  static SecureStorageService get instance {
    _instance ??= SecureStorageService._privateConstructor();
    return _instance!;
  }

  // 👇 Use EncryptedSharedPreferences on Android
  static const _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  // 👇 iOS uses default Keychain (no extra config needed)
  static const _iosOptions = IOSOptions();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
    aOptions: _androidOptions,
    iOptions: _iosOptions,
  );

  Future<void> write({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> deleteKey({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }
}
