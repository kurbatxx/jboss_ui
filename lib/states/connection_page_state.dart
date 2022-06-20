import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'connection_page_state.freezed.dart';

@freezed
class ConnectionPageState with _$ConnectionPageState {
  const factory ConnectionPageState({
    required TextEditingController hostController,
    required TextEditingController databaseNameController,
    required TextEditingController portController,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
  }) = _ConnectionPageState;
}
