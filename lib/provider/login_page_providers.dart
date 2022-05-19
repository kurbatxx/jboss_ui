import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/jboss.dart';
import 'package:jboss_ui/freezed/login_screen_state.dart';
import 'package:jboss_ui/models/login/login_response.dart';
import 'package:jboss_ui/models/login/login_request.dart';
import 'package:jboss_ui/navigation/main_navigation.dart';
import 'package:jboss_ui/screens/login_page/login_page.dart';
import 'package:jboss_ui/utils/dev_log.dart';
import 'package:jboss_ui/utils/secure.dart';

final loginScreenStateProvider =
    StateNotifierProvider<LoginScreenStateNotifer, LoginScreenState>(
  (ref) => LoginScreenStateNotifer(
    const LoginScreenState(
      login: '',
      password: '',
      isIninitial: true,
      isLoading: false,
      error: '',
      save: false,
    ),
  ),
);

class LoginScreenStateNotifer extends StateNotifier<LoginScreenState> {
  LoginScreenStateNotifer(
    LoginScreenState state,
  ) : super(state);

  initial() async {
    state = state.copyWith(isIninitial: true);

    state =
        state.copyWith(save: await SecureStorage.instance.getSaveLoginState());
    if (state.save) {
      state = state.copyWith(
        login: await SecureStorage.instance.getLogin(),
        password: await SecureStorage.instance.getLogin(),
      );
    }
    state = state.copyWith(isIninitial: false);
  }

  toogle() {
    state = state.copyWith(save: !state.save);
  }

  updateTextField(
      {required TextEditingController textController,
      required TextControllersEnum textControllersEnum}) {
    switch (textControllersEnum) {
      case TextControllersEnum.login:
        state = state.copyWith(
          login: textController.text,
        );
        break;
      case TextControllersEnum.password:
        state = state.copyWith(
          password: textController.text,
        );
        break;
    }
    state = state.copyWith(error: '');
  }

  Future<void> login(
      {required BuildContext context,
      required String login,
      required String password}) async {
    try {
      state = state.copyWith(isLoading: true);

      final loginResponseString = await compute(JbossApi.computeLogin,
          LoginRequest(login: login, password: password));
      Map<String, dynamic> loginResponseMap = jsonDecode(loginResponseString);
      LoginResponse loginResponse = LoginResponse.fromJson(loginResponseMap);

      if (loginResponse.error.isNotEmpty) {
        state = state.copyWith(
          isLoading: false,
          error: "Неправильный логин или пароль",
        );
        return;
      }

      if (!mounted) return;
      Navigator.of(context).pushNamed(NavigationRouteNames.hubScreen);

      if (await SecureStorage.instance.getSaveLoginState()) {
        await SecureStorage.instance.setLogin(login);
        await SecureStorage.instance.setPassword(password);
      }
      await Future.delayed(const Duration(milliseconds: 100));
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
          error: "Непридвиденная ошибка. Перезапустите программу");
    }
  }

  Future<void> logout(BuildContext context, WidgetRef ref) async {
    try {
      if (!await SecureStorage.instance.getSaveLoginState()) {
        state.copyWith(login: '', password: '');
      }
      await JbossApi.logout();

      if (!mounted) return;
      Navigator.of(context).pushNamed(NavigationRouteNames.loginScreen);
    } catch (e) {
      'Не удалось выйти'.log();
    }
  }
}
