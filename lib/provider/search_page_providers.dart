import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/jboss.dart';
import 'package:jboss_ui/freezed/search_page_state.dart';
import 'package:jboss_ui/models/search/search_request.dart';
import 'package:jboss_ui/models/search/search_response.dart';
import 'package:jboss_ui/utils/dev_log.dart';

final searchPageStateProvider =
    StateNotifierProvider<SearchPageStateNotifer, SearchPageState>(
  (ref) => SearchPageStateNotifer(
    const SearchPageState(
      isInitial: true,
      searchString: '',
      showDeleted: false,
      pageNumber: 1,
      maxPage: 1,
      clientList: [],
      isLoading: false,
      error: '',
    ),
  ),
);

class SearchPageStateNotifer extends StateNotifier<SearchPageState> {
  SearchPageStateNotifer(
    SearchPageState state,
  ) : super(state);

  showDeletedtoogle() {
    state = state.copyWith(showDeleted: !state.showDeleted);

    if (state.searchString.isNotEmpty) {
      search(paginated: false);
    }
  }

  setSearchString({required String text}) {
    state = state.copyWith(searchString: text);
  }

  search({required bool paginated}) async {
    if (state.searchString.isEmpty) return;
    if (paginated && !state.isLoading) {
      state.copyWith(
        pageNumber: state.pageNumber + 1,
      );
    }
    state = state.copyWith(
      isLoading: true,
      isInitial: false,
    );

    final searchRequest = SearchRequest(
      searchString: state.searchString,
      schoolId: 0,
      page: state.pageNumber,
      showDeleted: state.showDeleted,
    );

    final searchResponseString =
        await compute(JbossApi.computeSearch, searchRequest);
    Map<String, dynamic> searchResponseMap = jsonDecode(searchResponseString);
    SearchResponse searchResponse = SearchResponse.fromJson(searchResponseMap);

    if (searchResponse.error.isNotEmpty) {
      state.copyWith(
        error: searchResponse.error,
        isLoading: false,
      );
      return;
    }

    List<Client> clientList = [];
    if (!paginated) {
      clientList = clientList..addAll(searchResponse.clients);
    }

    state = state.copyWith(
      clientList: clientList,
      isLoading: false,
    );
  }

  clearState() {
    state = state.copyWith(
      isInitial: true,
      searchString: '',
      showDeleted: false,
      pageNumber: 1,
      clientList: [],
      isLoading: false,
      error: '',
    );
  }
}
