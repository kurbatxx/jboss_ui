import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/states/devices_list_page_state.dart';

final deviceListPageProvider =
    StateNotifierProvider<DevicesListPageStateNotifer, DeviicesListPageState>(
  (ref) => DevicesListPageStateNotifer(
    const DeviicesListPageState(
      devices: [],
    ),
  ),
);

class DevicesListPageStateNotifer extends StateNotifier<DeviicesListPageState> {
  DevicesListPageStateNotifer(
    DeviicesListPageState state,
  ) : super(state);

  getDevices() async {
    final devices = await DbApi.getSettingDevices();
    state = state.copyWith(devices: devices);
  }
}
