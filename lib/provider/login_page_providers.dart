import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/jboss.dart';
import 'package:jboss_ui/freezed/authorization_state.dart';
import 'package:jboss_ui/models/login/login_response.dart';
import 'package:jboss_ui/models/login/login_request.dart';
import 'package:jboss_ui/navigation/main_navigation.dart';
import 'package:jboss_ui/utils/custom_exception.dart';
import 'package:jboss_ui/utils/secure.dart';

final loginPasswordCheckboxProvider = StateProvider<bool>((ref) => false);

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

      final loginResponseString = await compute(JbossApi.computeLogin,
          LoginRequest(login: login, password: password));
      Map<String, dynamic> loginResponseMap = jsonDecode(loginResponseString);
      LoginResponse loginResponse = LoginResponse.fromJson(loginResponseMap);

      if (loginResponse.error.isEmpty) {
        state = const AuthorizationState.data();
        Navigator.of(context).pushNamed(NavigationRouteNames.hubScreen);
        if (await SecureStorage.instance.getSaveLoginState()) {
          await SecureStorage.instance.setLogin(login);
          await SecureStorage.instance.setPassword(password);
        }
      } else {
        throw RustException(loginResponse.error);
      }
    } on RustException catch (e) {
      state = AuthorizationState.error(e.toString());
    } catch (e) {
      state = const AuthorizationState.error(
          "Непридвиденная ошибка. Перезапустите программу");
    }
  }

  Future<void> logout(BuildContext context, WidgetRef ref) async {
    try {
      state = const AuthorizationState.initial();
      if (!await SecureStorage.instance.getSaveLoginState()) {
        ref.read(loginFormProvider).text = "";
        ref.read(passwordFormProvider).text = "";
      }
      await JbossApi.logout();
      Navigator.of(context).pushNamed(NavigationRouteNames.loginScreen);
    } catch (e) {
      state = const AuthorizationState.error("Что-то не так");
    }
  }
}
