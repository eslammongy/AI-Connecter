import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {
  late final FlutterSecureStorage appStorage;

  AppStorage() {
    _init();
  }
  Future _init() async {
    appStorage = FlutterSecureStorage(
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  Future putInAppStorage(String key, String? value) async {
    await appStorage.write(key: key, value: value);
  }

  Future<String?> getFromAppStorage(String key) async {
    return await appStorage.read(key: key);
  }

  deleteFromAppStorage(String key) async {
    await appStorage.delete(key: key);
  }
}
