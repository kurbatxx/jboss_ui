import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/models/search/search_response.dart';
import 'package:jboss_ui/states/new_task_page_state.dart';

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
      position: 1,
      listDevices: [],
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
  }
}
