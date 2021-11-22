import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/jboss_data.dart';
import 'package:jboss_ui/freezed/search_state.dart';
import 'package:jboss_ui/model/school_client.dart';
import 'package:jboss_ui/model/search_response.dart';

final deletePersonSwitcherProvider = StateProvider<bool>((ref) => true);
final selectCardStatusProvider = StateProvider<int>((ref) => 0);
final formSearchControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final searchProvider = StateNotifierProvider<Search, SearchState>(
  (ref) => Search(),
);

class Search extends StateNotifier<SearchState> {
  Search() : super(const SearchState.initial());

  Future<void> getSearchResult(
      {required BuildContext context,
      required SearchResponse searchResponse}) async {
    try {
      state = const SearchState.loading();
      await Future.delayed(const Duration(seconds: 0));
      final searchRequest = await compute(computeSearch, searchResponse);
      print(searchRequest);
      List<SchoolClient> schoolClients = schoolClientFromJson(searchRequest);

      state = SearchState.data(schoolClients);
    } catch (e) {
      state = const SearchState.error(
          "Непридвиденная ошибка. Перезапустите программу");
    }
  }

  Future<void> logout() async {
    state = const SearchState.initial();
  }
}
