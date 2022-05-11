import 'dart:convert';

import 'package:ffi/ffi.dart';
import 'package:jboss_ui/models/login/login_request.dart';
import 'package:jboss_ui/models/register_device/register_device_request.dart';
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
    return loginFFI(
      json.encode(loginRequest.toJson()).toNativeUtf8(),
    ).toDartString();
  }

  static String computeSearch(SearchRequest searchRequest) {
    return searchFFI(
      searchRequestToJson(searchRequest).toNativeUtf8(),
    ).toDartString();
  }

  static String computeRegisterDevice(
      RegisterDeviceRequest registerDeviceRequest) {
    return registerDeviceFFI(
      json.encode(registerDeviceRequest.toJson()).toNativeUtf8(),
    ).toDartString();
  }
}
