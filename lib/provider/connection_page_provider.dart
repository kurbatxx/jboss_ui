import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/states/connection_page_state.dart';
import 'package:jboss_ui/utils/dev_log.dart';
import 'package:jboss_ui/utils/secure.dart';

final connectionPageProvider =
    StateNotifierProvider<ConnectionPageStateNotifier, ConnectionPageState>(
  (ref) => ConnectionPageStateNotifier(
    ConnectionPageState(
      hostController: TextEditingController(),
      databaseNameController: TextEditingController(),
      portController: TextEditingController(),
      usernameController: TextEditingController(),
      passwordController: TextEditingController(),
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
  SecureStorage.instance.setDbHost(state.hostController.text.trim());
  SecureStorage.instance
      .setDatabaseName(state.databaseNameController.text.trim());
  SecureStorage.instance.setDbPort(state.portController.text.trim());
  SecureStorage.instance.setDbUsername(state.usernameController.text.trim());
  SecureStorage.instance.setDbPassword(state.passwordController.text.trim());
}
