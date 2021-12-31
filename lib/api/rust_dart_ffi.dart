import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/login_page_providers.dart';

import '../main.dart';

String getPath() {
  print("******************");
  final file = File(Directory.systemTemp.path + "\\jboss.txt");
  final appDir = file.readAsStringSync();
  print(appDir);
  print("******************");
  //print(upDir);
  String upDir = appDir.substring(0, appDir.length - 9);
  String path =
      upDir + '/ffi_jboss_rust_lib/target/debug/ffi_jboss_rust_lib.dll';
  return path;
}

typedef RustAuth = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);
typedef DartAuth = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);
final loginFFI = DynamicLibrary.open(getPath())
    .lookup<NativeFunction<RustAuth>>('login')
    .asFunction<DartAuth>();

typedef RustLogout = Pointer Function();
typedef DartLogout = Pointer Function();
final logoutFFI = DynamicLibrary.open(getPath())
    .lookup<NativeFunction<RustLogout>>('logout')
    .asFunction<DartLogout>();

typedef RustSearch = Pointer<Utf8> Function(Pointer<Utf8>);
typedef DartSearch = Pointer<Utf8> Function(Pointer<Utf8>);
final searchFFI = DynamicLibrary.open(getPath())
    .lookup<NativeFunction<RustSearch>>('search_person')
    .asFunction<DartSearch>();
