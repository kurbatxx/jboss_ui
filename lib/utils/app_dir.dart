import 'dart:io';
import 'package:flutter/foundation.dart';

String getAppDir() {
  final rawExePath = Platform.resolvedExecutable;
  final unixStylePath = rawExePath.replaceAll('\\', '/');
  int appDirIndex = unixStylePath.lastIndexOf(kReleaseMode ? '/' : '/build');
  final appDir = unixStylePath.substring(0, appDirIndex);
  return appDir;
}
