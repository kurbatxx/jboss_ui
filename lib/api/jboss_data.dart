import 'package:ffi/ffi.dart';

import 'package:http/http.dart' as http;
import 'package:jboss_ui/model/ffi_authorization.dart';
import 'package:jboss_ui/model/search_request.dart';
import 'package:jboss_ui/model/search_response.dart';
import 'package:jboss_ui/api/rust_dart_ffi.dart';

import '../main.dart';

class JbossDataApi {
  static Future<SearchResponse> getSearchResult(String responseText) async {
    await Future.delayed(const Duration(seconds: 2));
    final Uri url = Uri.parse("http://127.0.0.1:8000/data/" + responseText);
    final response = await http.get(url);
    return searchResponseFromJson(response.body);
  }
}

class InitialApi {
  static Future<void> initial() async {
    initialFFI(appDir.toNativeUtf8());
  }
}

class LoginApi {
  static Future<String> login(String login, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return loginFFI(
      login.toNativeUtf8(),
      password.toNativeUtf8(),
    ).toDartString();
  }

  static Future<void> logout() async {
    logoutFFI();
  }
}

String computeLogin(FFIAuthorization auth) {
  return loginFFI(
    auth.login.toNativeUtf8(),
    auth.password.toNativeUtf8(),
  ).toDartString();
}

String computeSearch(SearchRequest resp) {
  String jsonString = searchRequestToJson(resp);
  return searchFFI(jsonString.toNativeUtf8()).toDartString();
}
