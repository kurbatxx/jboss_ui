import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  //
  setDbHost(String dbHost) async {
    await _storage.write(key: "dbHost", value: dbHost);
  }

  setDatabaseName(String databaseName) async {
    await _storage.write(key: "databaseName", value: databaseName);
  }

  setDbPort(String dbPort) async {
    await _storage.write(key: "dbPort", value: dbPort);
  }

  setDbUsername(String dbUsername) async {
    await _storage.write(key: "dbUsername", value: dbUsername);
  }

  setDbPassword(String dbPassword) async {
    await _storage.write(key: "dbPassword", value: dbPassword);
  }

  //
  Future<String> getDbHost() async {
    return (await _storage.read(key: "dbHost") ?? "");
  }

  Future<String> getDatabaseName() async {
    return (await _storage.read(key: "databaseName") ?? "");
  }

  Future<String> getDbPort() async {
    return (await _storage.read(key: "dbPort") ?? "");
  }

  Future<String> getDbUsername() async {
    return (await _storage.read(key: "dbUsername") ?? "");
  }

  Future<String> getDbPassword() async {
    return (await _storage.read(key: "dbPassword") ?? "");
  }
}
