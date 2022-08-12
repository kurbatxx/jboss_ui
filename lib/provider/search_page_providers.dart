import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/jboss.dart';
import 'package:jboss_ui/models/generic/gen_req.dart';
import 'package:jboss_ui/states/search_page_state.dart';
import 'package:jboss_ui/models/search/search_request.dart';
import 'package:jboss_ui/models/search/search_response.dart';
import 'package:jboss_ui/utils/dev_log.dart';

final searchPageStateProvider =
    StateNotifierProvider<SearchPageStateNotifer, SearchPageState>(
  (ref) => SearchPageStateNotifer(
    SearchPageState(
      isInitial: true,
      focus: FocusNode(),
      searchController: TextEditingController(),
      searchBuffer: '',
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

    if (state.searchBuffer.isNotEmpty) {
      state = state.copyWith(
        searchController: state.searchController,
        pageNumber: 1,
        maxPage: 1,
        clientList: [],
      );
      state.searchBuffer.log();
      search(paginated: false);
    }
  }

  setSearchString({required String text}) {
    state = state.copyWith(searchController: TextEditingController(text: text));
  }

  setSwitchersSearchString({required String text}) {
    state = state.copyWith(searchBuffer: text);
  }

  search({required bool paginated}) async {
    if (state.isLoading) return;
    if (state.searchController.text.isEmpty) return;

    if (!paginated) {
      state = state.copyWith(clientList: []);
    }

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
      searchString: state.searchController.text.trim(),
      schoolId: 0,
      page: state.pageNumber,
      showDeleted: state.showDeleted,
    );

    searchRequest.searchString.log();

    final searchResponseString = await compute(JbossApi.createFFIString,
        GenReq(data: searchRequest, name: "search_person"));
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
      searchController: TextEditingController(),
      searchBuffer: '',
      showDeleted: false,
      pageNumber: 1,
      clientList: [],
      isLoading: false,
      error: '',
    );
  }
}
