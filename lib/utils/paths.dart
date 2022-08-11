import 'dart:io';
import 'package:flutter/foundation.dart';

class Paths {
  static String getAppDir() {
    final rawExePath = Platform.resolvedExecutable;
    final unixStylePath = rawExePath.replaceAll('\\', '/');
    int appDirIndex = unixStylePath.lastIndexOf(kReleaseMode ? '/' : '/build');
    final appDir = unixStylePath.substring(0, appDirIndex);
    return appDir;
  }

  static String getUpDir(String dir) {
    int upDirIndex = dir.lastIndexOf('/');
    final upDir = dir.substring(0, upDirIndex);
    return upDir;
  }

  static String getPathToDll() {
    final appDir = getAppDir();
    String pathDll = kReleaseMode
        ? '$appDir/jboss.dll'
        : '${getUpDir(appDir)}/ffi_jboss_rust_lib/target/debug/jboss.dll';
    return pathDll;
  }
}
