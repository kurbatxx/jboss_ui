import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/school_client.dart';

final loginCheckboxProvider = StateProvider<bool>((ref) => false);
final searchDeleteClientCheckboxProvider = StateProvider<bool>((ref) => false);
final freeCheckboxProvider = StateProvider<bool>((ref) => false);

final clientsList =
    StateProvider<List<SchoolClient>>((ref) => <SchoolClient>[]);
