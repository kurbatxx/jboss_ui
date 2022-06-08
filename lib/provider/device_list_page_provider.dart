import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/models/database/setting_type_device.dart';
import 'package:jboss_ui/states/devices_list_page_state.dart';

final deviceListPageProvider =
    StateNotifierProvider<DevicesListPageStateNotifer, DevicesListPageState>(
  (ref) => DevicesListPageStateNotifer(
    const DevicesListPageState(
      devices: [],
    ),
  ),
);

class DevicesListPageStateNotifer extends StateNotifier<DevicesListPageState> {
  DevicesListPageStateNotifer(
    DevicesListPageState state,
  ) : super(state);

  getDevices() async {
    final devices = await DbApi.getSettingDevices();
    state = state.copyWith(devices: devices);
  }

  updateList({
    required int oldIndex,
    required int newIndex,
  }) {
    List<SettingTypeDevice> modifyList = [];
    modifyList.addAll(state.devices);

    final SettingTypeDevice item = modifyList.removeAt(oldIndex);
    modifyList.insert(newIndex, item);
    state = state.copyWith(devices: modifyList);

    DbApi.updateTypeDevicePosition(
      oldPosition: oldIndex,
      newPosition: newIndex,
    );
  }
}
