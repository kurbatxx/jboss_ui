import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/school_client.dart';
import '../api/jboss_data.dart';

final loginCheckboxProvider = StateProvider<bool>((ref) => false);
final searchDeleteClientCheckboxProvider = StateProvider<bool>((ref) => false);
final freeCheckboxProvider = StateProvider<bool>((ref) => false);
final firstSearchProvider = StateProvider<bool>((ref) => true);
final searchProvider = StateProvider<bool>((ref) => false);

final textSearchProvider = StateProvider<String>((ref) => "Привет");

final clientsListProvider =
    StateProvider<List<SchoolClient>>((ref) => <SchoolClient>[]);

final futureProvider = FutureProvider.autoDispose((ref) {
  return JbossDataApi.getSearchResult("Text");
});
