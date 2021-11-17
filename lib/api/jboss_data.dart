import 'package:ffi/src/utf8.dart';
import 'package:http/http.dart' as http;
import './rust_dart_ffi.dart';

import '../model/school_client.dart';

class FFIAuthorization {
  String login;
  String password;

  FFIAuthorization({required this.login, required this.password});
}

class JbossDataApi {
  static Future<List<SchoolClient>> getSearchResult(String responseText) async {
    await Future.delayed(const Duration(seconds: 2));
    final Uri url = Uri.parse("http://127.0.0.1:8000/data/" + responseText);
    final response = await http.get(url);
    return schoolClientFromJson(response.body);
  }
}

class LoginApi {
  static Future<String> login(String login, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return loginFFI(login.toNativeUtf8(), password.toNativeUtf8())
        .toDartString();
  }

  static Future<void> logout() async {
    logoutFFI();
  }
}

String computeLogin(FFIAuthorization auth) {
  return loginFFI(auth.login.toNativeUtf8(), auth.password.toNativeUtf8())
      .toDartString();
}
