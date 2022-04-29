import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';

import '../main.dart';

String getUpDir(String dir) {
  int upDirIndex = dir.lastIndexOf('/');
  final upDir = dir.substring(0, upDirIndex);
  return upDir;
}

String getPathToDll() {
  String pathDll = kReleaseMode
      ? appDir + '/jboss.dll'
      : getUpDir(appDir) + '/ffi_jboss_rust_lib/target/debug/jboss.dll';
  return pathDll;
}

typedef RustInitial = Pointer Function(Pointer<Utf8>);
typedef DartInitial = Pointer Function(Pointer<Utf8>);

final initialFFI = DynamicLibrary.open(getPathToDll())
    .lookup<NativeFunction<RustInitial>>('initial')
    .asFunction<DartInitial>();

typedef RustAuth = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);
typedef DartAuth = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);
final loginFFI = DynamicLibrary.open(getPathToDll())
    .lookup<NativeFunction<RustAuth>>('login')
    .asFunction<DartAuth>();

typedef RustLogout = Pointer Function();
typedef DartLogout = Pointer Function();
final logoutFFI = DynamicLibrary.open(getPathToDll())
    .lookup<NativeFunction<RustLogout>>('logout')
    .asFunction<DartLogout>();

typedef RustSearch = Pointer<Utf8> Function(Pointer<Utf8>);
typedef DartSearch = Pointer<Utf8> Function(Pointer<Utf8>);
final searchFFI = DynamicLibrary.open(getPathToDll())
    .lookup<NativeFunction<RustSearch>>('search_person')
    .asFunction<DartSearch>();
