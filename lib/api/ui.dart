import 'package:jboss_ui/freezed/login_screen_state.dart';
import 'package:jboss_ui/utils/secure.dart';

class UiApi {
  static Future<LoginScreenState> initial() async {
    final login = await SecureStorage.instance.getLogin();
    final password = await SecureStorage.instance.getPassword();
    final save = await SecureStorage.instance.getSaveLoginState();

    return LoginScreenState(
      login: login,
      isLoading: false,
      password: password,
      save: save,
      error: '',
    );
  }
}
