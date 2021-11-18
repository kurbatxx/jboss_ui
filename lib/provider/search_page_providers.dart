import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/jboss_data.dart';
import 'package:jboss_ui/freezed/search_state.dart';
import 'package:jboss_ui/model/search_response.dart';

final deletePersonSwitcherProvider = StateProvider<bool>((ref) => true);

final searchProvider = StateNotifierProvider<Search, SearchState>(
  (ref) => Search(),
);

class Search extends StateNotifier<SearchState> {
  Search() : super(const SearchState.initial());

  Future<void> getSearchResult({required BuildContext context}) async {
    try {
      state = const SearchState.loading();
      await Future.delayed(const Duration(seconds: 1));
      final searchResponse = await compute(
        computeSearch,
        SearchResponse(
          id: 0,
          response: "Иванов",
          schoolId: 0,
          cards: 0,
          page: 1,
          showDelete: true,
        ),
      );
      print(searchResponse);

      state = const SearchState.data();
    } catch (e) {
      state = const SearchState.error(
          "Непридвиденная ошибка. Перезапустите программу");
    }
  }
}
