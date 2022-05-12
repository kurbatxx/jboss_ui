import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';

import 'package:jboss_ui/main.dart';

String getUpDir(String dir) {
  int upDirIndex = dir.lastIndexOf('/');
  final upDir = dir.substring(0, upDirIndex);
  return upDir;
}

String getPathToDll() {
  String pathDll = kReleaseMode
      ? '$appDir/jboss.dll'
      : '${getUpDir(appDir)}/ffi_jboss_rust_lib/target/debug/jboss.dll';
  return pathDll;
}

typedef NullPointerFunc = Pointer<Utf8> Function();
typedef OnePointerFunc = Pointer<Utf8> Function(Pointer<Utf8>);

final initialFFI = DynamicLibrary.open(getPathToDll())
    .lookup<NativeFunction<OnePointerFunc>>('initial')
    .asFunction<OnePointerFunc>();

final loginFFI = DynamicLibrary.open(getPathToDll())
    .lookup<NativeFunction<OnePointerFunc>>('login')
    .asFunction<OnePointerFunc>();

final logoutFFI = DynamicLibrary.open(getPathToDll())
    .lookup<NativeFunction<NullPointerFunc>>('logout')
    .asFunction<NullPointerFunc>();

final searchFFI = DynamicLibrary.open(getPathToDll())
    .lookup<NativeFunction<OnePointerFunc>>('search_person')
    .asFunction<OnePointerFunc>();

final registerDeviceFFI = DynamicLibrary.open(getPathToDll())
    .lookup<NativeFunction<OnePointerFunc>>('register_device')
    .asFunction<OnePointerFunc>();
