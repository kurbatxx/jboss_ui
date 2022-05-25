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

    state = state.copyWith(
      clientList: state.clientList..addAll(searchResponse.clients),
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

// final 
// = StateProvider<bool>((ref) => true);
// final selectCardStatusProvider = StateProvider<int>((ref) => 0);

// final paginationCounterProvider = StateProvider<int>((ref) => 1);
// final paginationLimiterProvider = StateProvider<int>((ref) => 0);

// final formSearchControllerProvider =
//     StateProvider<TextEditingController>((ref) => TextEditingController());
// final listSchoolClientProvider = StateProvider<List<Client>>((ref) => []);
// final searchProvider = StateNotifierProvider<Search, SearchState>(
//   (ref) => Search(),
// );

// class Search extends StateNotifier<SearchState> {
//   Search() : super(const SearchState.initial());

//   Future<void> getSearchResult(
//       {required BuildContext context,
//       required WidgetRef ref,
//       required SearchRequest searchRequest}) async {
//     try {
//       state = const SearchState.loading();
//       ref.read(paginationCounterProvider.state).state = 1;
//       ref.read(listSchoolClientProvider.state).state = [];
//       final searchResponse =
//           await compute(JbossApi.computeSearch, searchRequest);
//       final searchResponseObjects = searchResponseFromJson(searchResponse);
//       ref.read(paginationLimiterProvider.state).state =
//           searchResponseObjects.allPages;
//       List<Client> schoolClients = searchResponseObjects.clients;
//       schoolClients =
//           ref.read(listSchoolClientProvider.state).state = schoolClients;
//       if (schoolClients.isEmpty) {
//         state = const SearchState.noData();
//       } else {
//         state = const SearchState.data();
//       }
//     } catch (e) {
//       state = const SearchState.error(
//           "Непридвиденная ошибка. Перезапустите программу");
//     }
//   }

//   Future<void> getNextPageResult(
//       {required BuildContext context,
//       required WidgetRef ref,
//       required SearchRequest searchRequest}) async {
//     try {
//       final searchResponse =
//           await compute(JbossApi.computeSearch, searchRequest);
//       List<Client> schoolClients =
//           searchResponseFromJson(searchResponse).clients;
//       schoolClients = ref.read(listSchoolClientProvider.state).state
//         ..addAll(schoolClients);
//       state = const SearchState.data();
//       ref.watch(paginationCounterProvider.state).state = searchRequest.page;
//     } catch (e) {
//       state = const SearchState.error(
//           "Непридвиденная ошибка. Перезапустите программу");
//     }
//   }

//   Future<void> logout() async {
//     state = const SearchState.initial();
//   }
// }