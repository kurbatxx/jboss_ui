import 'package:ffi/ffi.dart';
import 'package:jboss_ui/models/login/ffi_authorization.dart';
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
}

String computeLogin(FFIAuthorization auth) {
  return loginFFI(
    auth.login.toNativeUtf8(),
    auth.password.toNativeUtf8(),
  ).toDartString();
}

String computeSearch(SearchRequest searchRequest) {
  return searchFFI(
    searchRequestToJson(searchRequest).toNativeUtf8(),
  ).toDartString();
}
