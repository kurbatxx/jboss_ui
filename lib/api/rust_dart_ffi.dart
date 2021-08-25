import 'dart:ffi';
import 'package:ffi/ffi.dart';


import 'dart:io' show Platform;

import 'dart:io';

typedef FFIAuth = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);
typedef DartAuth = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>);

final DynamicLibrary dynLib = _readDynLib();

DynamicLibrary _readDynLib() {
  String path = './rust_lib.so';
  if (Platform.isMacOS) path = './rust_lib.dylib';
  if (Platform.isWindows) path = 'ffi_jboss_rust_lib.dll';
  return DynamicLibrary.open(path);
}

final auth = dynLib
    .lookup<NativeFunction<FFIAuth>>('authorization')
    .asFunction<DartAuth>();
