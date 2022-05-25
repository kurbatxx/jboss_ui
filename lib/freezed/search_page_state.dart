import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jboss_ui/models/search/search_response.dart';
part 'search_page_state.freezed.dart';

@freezed
class SearchPageState with _$SearchPageState {
  const factory SearchPageState(
      {required bool isInitial,
      required String searchString,
      required bool showDeleted,
      required int pageNumber,
      required bool isLoading,
      required String error,
      required List<Client> clientList,
      required}) = _SearchPageState;
}
