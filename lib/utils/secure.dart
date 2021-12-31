import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jboss_ui/provider/login_page_providers.dart';

class SecureStorage {
  static SecureStorage instance = SecureStorage._();
  SecureStorage._();

  final _storage = const FlutterSecureStorage();

  setSaveLoginState(bool state) async {
    await _storage.write(key: "saveLogin", value: state.toString());
  }

  Future<bool> getSaveLoginState() async =>
      (await _storage.read(key: "saveLogin") == 'true') ? true : false;

  setShowDeleteState(bool state) async {
    await _storage.write(key: "showDelete", value: state.toString());
  }

  Future<bool> getShowDeleteState() async =>
      (await _storage.read(key: "showDelete") == 'true') ? true : false;

  Future<String> getLogin() async {
    return (await _storage.read(key: "login") ?? "");
  }

  Future<String> getPassword() async {
    return (await _storage.read(key: "password") ?? "");
  }

  Future<String> getAppDir() async {
    return (await _storage.read(key: "appDir") ?? "***");
  }

  setLogin(String login) async {
    await _storage.write(key: "login", value: login);
  }

  setPassword(String password) async {
    await _storage.write(key: "password", value: password);
  }

  setAppDir(String appDir) async {
    await _storage.write(key: "appDir", value: appDir);
  }
}
