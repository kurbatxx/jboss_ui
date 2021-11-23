import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jboss_ui/model/school_client.dart';
part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = Initial;
  const factory SearchState.data(List<SchoolClient> schoolClients) = Data;
  const factory SearchState.noData() = NoData;
  const factory SearchState.error(String errorText) = Error;
  const factory SearchState.loading() = Loading;
}
