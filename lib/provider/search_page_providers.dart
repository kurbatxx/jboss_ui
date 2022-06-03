import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/jboss.dart';
import 'package:jboss_ui/states/search_page_state.dart';
import 'package:jboss_ui/models/search/search_request.dart';
import 'package:jboss_ui/models/search/search_response.dart';
import 'package:jboss_ui/utils/dev_log.dart';

final searchPageStateProvider =
    StateNotifierProvider<SearchPageStateNotifer, SearchPageState>(
  (ref) => SearchPageStateNotifer(
    const SearchPageState(
      isInitial: true,
      searchString: '',
      switchersSearchString: '',
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

    if (state.switchersSearchString.isNotEmpty) {
      state = state.copyWith(
        searchString: state.switchersSearchString,
        pageNumber: 1,
        maxPage: 1,
        clientList: [],
      );

      search(paginated: false);
    }
  }

  setSearchString({required String text}) {
    state = state.copyWith(searchString: text);
  }

  setSwitchersSearchString({required String text}) {
    state = state.copyWith(switchersSearchString: text);
  }

  search({required bool paginated}) async {
    'Ищу'.log();
    if (state.isLoading) return;
    if (state.searchString.isEmpty) return;

    await Future.delayed(const Duration(seconds: 0));
    if (paginated && !state.isLoading) {
      state = state.copyWith(
        pageNumber: state.pageNumber + 1,
      );
    }

    "page_: ${state.pageNumber}".log();

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

    searchRequest.searchString.log();

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
    } else {
      clientList = clientList
        ..addAll(state.clientList)
        ..addAll(searchResponse.clients);
    }

    "page: ${state.pageNumber}".log();
    state = state.copyWith(
      maxPage: searchResponse.maxPage,
      clientList: clientList,
      isLoading: false,
    );
  }

  clearState() {
    state = state.copyWith(
      isInitial: true,
      searchString: '',
      switchersSearchString: '',
      showDeleted: false,
      pageNumber: 1,
      clientList: [],
      isLoading: false,
      error: '',
    );
  }
}
