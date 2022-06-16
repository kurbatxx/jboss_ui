import 'package:jboss_ui/states/connection_page_state.dart';
import 'package:jboss_ui/states/login_screen_state.dart';
import 'package:jboss_ui/utils/secure.dart';

class UiInitialApi {
  static Future<LoginScreenState> getLoginState() async {
    return LoginScreenState(
      login: await SecureStorage.instance.getLogin(),
      password: await SecureStorage.instance.getPassword(),
      save: await SecureStorage.instance.getSaveLoginState(),
      isLoading: false,
      error: '',
    );
  }

  static Future<ConnectionPageState> getConnetionPageState() async {
    return ConnectionPageState(
      host: await SecureStorage.instance.getDbHost(),
      databaseName: await SecureStorage.instance.getDatabaseName(),
      port: await SecureStorage.instance.getDbPort(),
      username: await SecureStorage.instance.getDbUsername(),
      password: await SecureStorage.instance.getDbPassword(),
    );
  }
}
