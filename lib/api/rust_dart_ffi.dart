import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:jboss_ui/utils/paths.dart';

typedef NullPointerFunc = Pointer<Utf8> Function();
typedef OnePointerFunc = Pointer<Utf8> Function(Pointer<Utf8>);

OnePointerFunc ffi({required String funcName}) {
  return DynamicLibrary.open(Paths.getPathToDll())
      .lookup<NativeFunction<OnePointerFunc>>(funcName)
      .asFunction<OnePointerFunc>();
}

final logoutFFI = DynamicLibrary.open(Paths.getPathToDll())
    .lookup<NativeFunction<NullPointerFunc>>('logout')
    .asFunction<NullPointerFunc>();
