import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jboss_ui/models/search/search_response.dart';
part 'search_page_state.freezed.dart';

@freezed
class SearchPageState with _$SearchPageState {
  const factory SearchPageState({
    required bool isInitial,
    required FocusNode focus,
    required TextEditingController searchController,
    required String searchBuffer,
    required bool showDeleted,
    required int pageNumber,
    required int maxPage,
    required bool isLoading,
    required String error,
    required List<Client> clientList,
  }) = _SearchPageState;
}
