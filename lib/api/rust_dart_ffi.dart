import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/login_page_providers.dart';

import '../main.dart';

String getUpDir(String dir) {
  int upDirIndex = dir.lastIndexOf('/');
  final upDir = dir.substring(0, upDirIndex);
  return upDir;
}

String getPathToDll() {
  print("******************");
  print(appDir);
  print("******************");

  String pathDll = kReleaseMode
      ? appDir + '/ffi_jboss_rust_lib.dll'
      : getUpDir(appDir) +
          '/ffi_jboss_rust_lib/target/debug/ffi_jboss_rust_lib.dll';
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
