import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final isColoredDeviceProvider = StateProvider<bool>((ref) => false);
final svgFileProvider = StateProvider<File?>((ref) => null);
