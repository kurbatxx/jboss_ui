import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/jboss_data.dart';
import 'package:jboss_ui/freezed/authorization_state.dart';
import 'package:jboss_ui/navigation/main_navigation.dart';
import 'package:jboss_ui/utils/secure.dart';

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

  Future<void> login(
      {required BuildContext context,
      required String login,
      required String password}) async {
    try {
      state = const AuthorizationState.loading();
      //await Future.delayed(const Duration(seconds: 1));
      String resp = await LoginApi.login(login, password);
      print(resp);
      state = const AuthorizationState.data();
      Navigator.of(context).pushNamed(MainNavigationRouteNames.hubScreen);
      if (await SecureStorage.instance.getSaveLoginState()) {
        await SecureStorage.instance.setLogin(login);
        await SecureStorage.instance.setPassword(password);
      }
    } catch (e) {
      state = const AuthorizationState.error("Не авторизовался");
    }
  }

  Future<void> logout(BuildContext context, WidgetRef ref) async {
    try {
      state = const AuthorizationState.initial();
      if (!await SecureStorage.instance.getSaveLoginState()) {
        ref.read(loginFormProvider).text = "";
        ref.read(passwordFormProvider).text = "";
      }
      await LoginApi.logout();
      Navigator.of(context).pushNamed(MainNavigationRouteNames.loginScreen);
    } catch (e) {
      state = const AuthorizationState.error("Что-то не так");
    }
  }
}
