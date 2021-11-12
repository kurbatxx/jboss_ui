import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static SecureStorage instance = SecureStorage._();
  SecureStorage._();

  final _storage = const FlutterSecureStorage();
  setSaveLoginState(bool state) async {
    await _storage.write(key: "saveLogin", value: state.toString());
    print(state.toString());
  }

  Future<bool> getSaveLoginState() async =>
      (await _storage.read(key: "saveLogin") == 'true') ? true : false;
}
