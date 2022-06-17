import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/states/connection_page_state.dart';
import 'package:jboss_ui/utils/dev_log.dart';
import 'package:jboss_ui/utils/secure.dart';

final connectionPageProvider =
    StateNotifierProvider<ConnectionPageStateNotifier, ConnectionPageState>(
  (ref) => ConnectionPageStateNotifier(
    const ConnectionPageState(
      host: '',
      databaseName: '',
      port: '',
      username: '',
      password: '',
    ),
  ),
);

class ConnectionPageStateNotifier extends StateNotifier<ConnectionPageState> {
  ConnectionPageStateNotifier(
    ConnectionPageState state,
  ) : super(state);

  Future<bool> checkConnect({required ConnectionPageState newState}) async {
    await DbApi.inst.conn.close();
    state = newState;
    

    await DbApi.inst.init(connectionState: state);
    try {
      await DbApi.inst.conn.open();
      setConnectionOptions(state: state);
    } catch (e) {
      e.log();
      return false;
    }
    return true;
  }
}

void setConnectionOptions({required ConnectionPageState state}) {
  SecureStorage.instance.setDbHost(state.host);
  SecureStorage.instance.setDatabaseName(state.databaseName);
  SecureStorage.instance.setDbPort(state.port);
  SecureStorage.instance.setDbUsername(state.username);
  SecureStorage.instance.setDbPassword(state.password);
}
