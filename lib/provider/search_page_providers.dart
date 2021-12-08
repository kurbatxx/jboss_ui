import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/jboss_data.dart';
import 'package:jboss_ui/freezed/search_state.dart';
import 'package:jboss_ui/model/search_response.dart';
import 'package:jboss_ui/model/search_request.dart';
import 'package:jboss_ui/provider/search_pagination_providers.dart';

final deletePersonSwitcherProvider = StateProvider<bool>((ref) => true);
final selectCardStatusProvider = StateProvider<int>((ref) => 0);

final paginationCounterProvider = StateProvider<int>((ref) => 1);
final paginationLimiterProvider = StateProvider<int>((ref) => 0);

final formSearchControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final listSchoolClientProvider = StateProvider<List<Client>>((ref) => []);

final searchProvider = StateNotifierProvider<Search, SearchState>(
  (ref) => Search(),
);

class Search extends StateNotifier<SearchState> {
  Search() : super(const SearchState.initial());

  Future<void> getSearchResult(
      {required BuildContext context,
      required WidgetRef ref,
      required SearchRequest searchRequest}) async {
    try {
      state = const SearchState.loading();
      ref.read(paginationCounterProvider.state).state = 1;
      ref.read(listSchoolClientProvider.state).state = [];
      final searchResponse = await compute(computeSearch, searchRequest);
      final searchResponseObjects = searchResponseFromJson(searchResponse);
      ref.read(paginationLimiterProvider.state).state =
          searchResponseObjects.allPages;
      List<Client> schoolClients = searchResponseObjects.clients;
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
      required SearchRequest searchRequest}) async {
    try {
      print('Понеслась!!!!!!!!!!!!');
      ref.watch(paginationProvider.notifier).loading();
      await Future.delayed(Duration(seconds: 5));
      final searchResponse = await compute(computeSearch, searchRequest);
      print('Новая порция');
      List<Client> schoolClients =
          searchResponseFromJson(searchResponse).clients;
      schoolClients = ref.read(listSchoolClientProvider.state).state
        ..addAll(schoolClients);
      ref.watch(paginationProvider.notifier).data();
      state = const SearchState.data();
      ref.read(paginationCounterProvider.state).state = searchRequest.page;
    } catch (e) {
      state = const SearchState.error(
          "Непридвиденная ошибка. Перезапустите программу");
    }
  }

  Future<void> logout() async {
    state = const SearchState.initial();
  }
}
