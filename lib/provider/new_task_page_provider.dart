import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/database.dart';

import 'package:jboss_ui/models/search/search_response.dart';
import 'package:jboss_ui/states/new_task_page_state.dart';
import 'package:jboss_ui/utils/dev_log.dart';

final newTaskStateProvider =
    StateNotifierProvider<NewTaskPageStateNotifer, NewTaskPageState>(
  (ref) => NewTaskPageStateNotifer(
    const NewTaskPageState(
      client: Client(
        id: 'id',
        fullName: FullName(
          name: 'name',
          surname: 'surname',
          patronymic: 'patronymic',
        ),
        group: 'group',
        school: 'school',
        balance: 'balance',
      ),
      devicePosition: 0,
      colorPosition: 0,
      listDevices: [],
      listColoredDevices: [],
      dbDeviceId: 0,
    ),
  ),
);

class NewTaskPageStateNotifer extends StateNotifier<NewTaskPageState> {
  NewTaskPageStateNotifer(
    NewTaskPageState state,
  ) : super(state);

  init({required Client client}) {
    state = state.copyWith(client: client);
    getDevices();
  }

  getDevices() async {
    final devices = await DbApi.getDevices();
    state = state.copyWith(listDevices: devices);
    if (state.listDevices.isNotEmpty) {
      getColors(
          typeDeviceId: state.listDevices[state.devicePosition].typeDeviceId);
    }
  }

  selectDevice({required int selected}) {
    state = state.copyWith(devicePosition: selected);
    getColors(
        typeDeviceId: state.listDevices[state.devicePosition].typeDeviceId);
  }

  getColors({required int typeDeviceId}) async {
    final coloredDevices = await DbApi.getColors(typeDeviceId: typeDeviceId);
    state = state.copyWith(listColoredDevices: coloredDevices);
    if (coloredDevices.isEmpty) {
      final dbDeviceId =
          await DbApi.setColoredDevicesId(typeDeviceId: typeDeviceId);
      state = state.copyWith(dbDeviceId: dbDeviceId);
    } else {
      state = state.copyWith(
          dbDeviceId: state.listColoredDevices[state.colorPosition].deviceId);
    }
    state.dbDeviceId.log();
  }

  selectColor({required int selected}) {
    state = state.copyWith(
        colorPosition: selected,
        dbDeviceId: state.listColoredDevices[selected].deviceId);
    state.dbDeviceId.log();
  }
}
