import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_screen_state.freezed.dart';

@freezed
class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState({
    required String login,
    required String password,
    required bool save,
    required bool isLoading,
    required String error,
  }) = _LoginScreenState;
}
