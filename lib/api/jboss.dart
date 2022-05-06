import 'package:ffi/ffi.dart';
import 'package:jboss_ui/models/login/login_request.dart';
import 'package:jboss_ui/models/search/search_request.dart';
import 'package:jboss_ui/api/rust_dart_ffi.dart';

import 'package:jboss_ui/main.dart';

class JbossApi {
  static Future<void> initial() async {
    initialFFI(appDir.toNativeUtf8());
  }

  static Future<void> logout() async {
    logoutFFI();
  }

  static String computeLogin(LoginRequest loginRequest) {
    print(loginRequest.toJson().toString());
    return loginFFI(
      loginRequest.toJson().toString().toNativeUtf8(),
    ).toDartString();
  }

  static String computeSearch(SearchRequest searchRequest) {
    return searchFFI(
      searchRequestToJson(searchRequest).toNativeUtf8(),
    ).toDartString();
  }
}
