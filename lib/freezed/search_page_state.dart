import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_page_state.freezed.dart';

@freezed
class SearchPageState with _$SearchPageState {
  const factory SearchPageState({
    required String searchRequest,
  }) = _SearchPageState;
}
