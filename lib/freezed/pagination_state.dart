import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination_state.freezed.dart';

@freezed
class PaginationState with _$PaginationState {
  const factory PaginationState.data() = Data;
  const factory PaginationState.loading() = Loading;
  const factory PaginationState.error(String errorText) = Error;
}
