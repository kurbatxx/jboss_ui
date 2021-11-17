import 'dart:ffi';
import 'package:ffi/ffi.dart';

import 'dart:io' show Platform;

import 'dart:io';

final DynamicLibrary dynLib = _readDynLib();
DynamicLibrary _readDynLib() {
  String path = './rust_lib.so';
  if (Platform.isMacOS) path = './rust_lib.dylib';
  if (Platform.isWindows) {
    path = '../ffi_jboss_rust_lib/target/debug/ffi_jboss_rust_lib.dll';
  }
  return DynamicLibrary.open(path);
}

typedef RustAuth = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);
typedef DartAuth = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);
final loginFFI =
    dynLib.lookup<NativeFunction<RustAuth>>('login').asFunction<DartAuth>();

typedef RustLogout = Pointer Function();
typedef DartLogout = Pointer Function();
final logoutFFI = dynLib
    .lookup<NativeFunction<RustLogout>>('logout')
    .asFunction<DartLogout>();
