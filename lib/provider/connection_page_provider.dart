import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/states/connection_page_state.dart';
import 'package:jboss_ui/utils/dev_log.dart';

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

  void checkConnect({required ConnectionPageState newState}) {
    state = newState;

    DbApi.inst.init(connectionState: state);
    try {
      DbApi.inst.conn.open();
    } catch (e) {
      e.log();
    }
  }
}
