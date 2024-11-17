import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AppStorage {
  static late FlutterSecureStorage appStorage;

  static Future init() async {
    appStorage = FlutterSecureStorage(
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  static Future setInAppStorage(String key, String value) async {
    await appStorage.write(key: key, value: value);
  }

  static Future<String?> getFromAppStorage(String key) async {
    return await appStorage.read(key: key);
  }

  Future deleteSecureStorage(String key) async {
    await appStorage.delete(key: key);
  }
}
