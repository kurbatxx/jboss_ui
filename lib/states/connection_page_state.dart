import 'package:freezed_annotation/freezed_annotation.dart';
part 'connection_page_state.freezed.dart';

@freezed
class ConnectionPageState with _$ConnectionPageState {
  const factory ConnectionPageState({
    required String host,
    required String databaseName,
    required String port,
    required String username,
    required String password,
  }) = _ConnectionPageState;
}
