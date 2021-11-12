import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/freezed/authorization_state.dart';
import 'package:jboss_ui/navigation/main_navigation.dart';

final loginPasswordCheckboxProvider = StateProvider<bool>((ref) => false);
final deletePersonSwitcherProvider = StateProvider<bool>((ref) => true);

final loginFormProvider = StateProvider((ref) => TextFormProperties("", null));
final passwordFormProvider =
    StateProvider((ref) => TextFormProperties("", null));

class TextFormProperties {
  String text;
  String? error;
  TextFormProperties(this.text, this.error);

  TextFormProperties updateField(String value) {
    text = value.trim();
    if (text.isEmpty) {
      return TextFormProperties(text, "Поле не может быть пустым");
    }
    return TextFormProperties(text, null);
  }

  @override
  String toString() {
    return "text: $text, error: $error)";
  }
}

final authorizationProvider =
    StateNotifierProvider<Authorization, AuthorizationState>(
  (ref) => Authorization(),
);

class Authorization extends StateNotifier<AuthorizationState> {
  Authorization() : super(const AuthorizationState.initial());

  Future<void> login(BuildContext context) async {
    try {
      state = const AuthorizationState.loading();
      await Future.delayed(const Duration(seconds: 1));
      state = const AuthorizationState.data();
      Navigator.of(context).pushNamed(MainNavigationRouteNames.hubScreen);
    } catch (e) {
      state = const AuthorizationState.error("Не авторизовался");
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      state = const AuthorizationState.initial();
      Navigator.of(context).pushNamed(MainNavigationRouteNames.loginScreen);
    } catch (e) {
      state = const AuthorizationState.error("Что-то не так");
    }
  }
}
