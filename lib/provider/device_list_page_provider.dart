import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/models/database/setting_type_device.dart';
import 'package:jboss_ui/states/devices_list_page_state.dart';
import 'package:jboss_ui/utils/dev_log.dart';

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

  updateList({
    required int oldIndex,
    required int newIndex,
  }) {
    '-------'.log();
    oldIndex.log();
    newIndex.log();

    List<SettingTypeDevice> modifyList = [];
    modifyList.addAll(state.devices);

    final SettingTypeDevice item = modifyList.removeAt(oldIndex);
    modifyList.insert(newIndex, item);
    state = state.copyWith(devices: modifyList);
  }
}
