import 'package:flutter/cupertino.dart';
import 'package:jboss_ui/states/connection_page_state.dart';
import 'package:jboss_ui/states/login_screen_state.dart';
import 'package:jboss_ui/utils/secure.dart';

class UiInitialApi {
  static Future<LoginScreenState> getLoginState() async {
    final login = await SecureStorage.instance.getLogin();
    final password = await SecureStorage.instance.getPassword();
    return LoginScreenState(
      loginController: TextEditingController(text: login),
      passwordController: TextEditingController(text: password),
      save: await SecureStorage.instance.getSaveLoginState(),
      isLoading: false,
      error: '',
    );
  }

  static Future<ConnectionPageState> getConnetionPageState() async {
    return ConnectionPageState(
      hostController: TextEditingController(
        text: await SecureStorage.instance.getDbHost(),
      ),
      databaseNameController: TextEditingController(
        text: await SecureStorage.instance.getDatabaseName(),
      ),
      portController: TextEditingController(
        text: await SecureStorage.instance.getDbPort(),
      ),
      usernameController: TextEditingController(
        text: await SecureStorage.instance.getDbUsername(),
      ),
      passwordController: TextEditingController(
        text: await SecureStorage.instance.getDbPassword(),
      ),
    );
  }
}
