import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/jboss_data.dart';
import 'package:jboss_ui/freezed/search_state.dart';
import 'package:jboss_ui/model/school_client.dart';
import 'package:jboss_ui/model/search_response.dart';

final deletePersonSwitcherProvider = StateProvider<bool>((ref) => true);
final selectCardStatusProvider = StateProvider<int>((ref) => 0);
final pageProvider = StateProvider<int>((ref) => 1);

final formSearchControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final listSchoolClientProvider = StateProvider<List<SchoolClient>>((ref) => []);

final searchProvider = StateNotifierProvider<Search, SearchState>(
  (ref) => Search(),
);

class Search extends StateNotifier<SearchState> {
  Search() : super(const SearchState.initial());

  Future<void> getSearchResult(
      {required BuildContext context,
      required WidgetRef ref,
      required SearchResponse searchResponse}) async {
    try {
      state = const SearchState.loading();
      ref.read(listSchoolClientProvider.state).state = [];
      final searchRequest = await compute(computeSearch, searchResponse);
      print(searchRequest);
      List<SchoolClient> schoolClients = schoolClientFromJson(searchRequest);
      schoolClients =
          ref.read(listSchoolClientProvider.state).state = schoolClients;
      if (schoolClients.isEmpty) {
        state = const SearchState.noData();
      } else {
        state = const SearchState.data();
      }
    } catch (e) {
      state = const SearchState.error(
          "Непридвиденная ошибка. Перезапустите программу");
    }
  }

  Future<void> getNextPageResult(
      {required BuildContext context,
      required WidgetRef ref,
      required SearchResponse searchResponse}) async {
    try {
      final searchRequest = await compute(computeSearch, searchResponse);
      print('Новая порция');
      print(searchRequest);
      List<SchoolClient> schoolClients = schoolClientFromJson(searchRequest);
      schoolClients = ref.read(listSchoolClientProvider.state).state
        ..addAll(schoolClients);
      state = const SearchState.data();
    } catch (e) {
      state = const SearchState.error(
          "Непридвиденная ошибка. Перезапустите программу");
    }
  }

  Future<void> logout() async {
    state = const SearchState.initial();
  }
}
