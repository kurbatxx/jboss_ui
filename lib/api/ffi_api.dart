import 'dart:convert';
import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:jboss_ui/models/generic/gen_req.dart';
import 'package:jboss_ui/utils/paths.dart';
import 'dart:ffi';

typedef NullPointerFunc = Pointer<Utf8> Function();
typedef OnePointerFunc = Pointer<Utf8> Function(Pointer<Utf8>);

class FFIApi {
  static Future<void> initial() async {
    _ffi(funcName: "initial")(Paths.getAppDir().toNativeUtf8());
  }

  static Future<Map<String, dynamic>> getResp<T>(GenReq<T> request) async {
    final responseString = await compute(FFIApi._createFFIString,
        GenReq(name: request.name, data: request.data));

    Map<String, dynamic> responseMap = jsonDecode(responseString);
    return responseMap;
  }

  static Future<void> logout() async {
    _ffiWithoutParam(funcName: "logout");
  }

  static String _createFFIString<T>(
    GenReq<T> request,
  ) {
    return _ffi(funcName: request.name)(
      json.encode(request.data).toNativeUtf8(),
    ).toDartString();
  }

  static OnePointerFunc _ffi({required String funcName}) {
    return DynamicLibrary.open(Paths.getPathToDll())
        .lookup<NativeFunction<OnePointerFunc>>(funcName)
        .asFunction<OnePointerFunc>();
  }

  static NullPointerFunc _ffiWithoutParam({required String funcName}) {
    return DynamicLibrary.open(Paths.getPathToDll())
        .lookup<NativeFunction<NullPointerFunc>>(funcName)
        .asFunction<NullPointerFunc>();
  }
}
