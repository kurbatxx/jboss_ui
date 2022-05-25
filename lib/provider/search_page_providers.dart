import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/freezed/search_page_state.dart';

final searchPageStateProvider =
    StateNotifierProvider<SearchPageStateNotifer, SearchPageState>(
  (ref) => SearchPageStateNotifer(
    const SearchPageState(
      isInitial: true,
      searchString: '',
      showDeleted: false,
      pageNumber: 0,
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