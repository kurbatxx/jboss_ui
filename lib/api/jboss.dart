import 'dart:convert';

import 'package:ffi/ffi.dart';
import 'package:jboss_ui/models/generic/gen_req.dart';
import 'package:jboss_ui/models/register_device/register_device_request.dart';
import 'package:jboss_ui/models/search/search_request.dart';
import 'package:jboss_ui/api/rust_dart_ffi.dart';
import 'package:jboss_ui/utils/paths.dart';

class JbossApi {
  static Future<void> initial() async {
    ffi(funcName: "initial")(Paths.getAppDir().toNativeUtf8());
  }

  static Future<void> logout() async {
    logoutFFI();
  }

  static String computeLogin<T>(GenReq<T> loginRequest) {
    return ffi(funcName: "login")(
      json.encode(loginRequest.data).toNativeUtf8(),
    ).toDartString();
  }

  static String computeSearch(SearchRequest searchRequest) {
    return ffi(funcName: "search_person")(
      json.encode(searchRequest.toJson()).toNativeUtf8(),
    ).toDartString();
  }

  static String computeRegisterDevice(
      RegisterDeviceRequest registerDeviceRequest) {
    return ffi(funcName: "register_device")(
      json.encode(registerDeviceRequest.toJson()).toNativeUtf8(),
    ).toDartString();
  }
}
