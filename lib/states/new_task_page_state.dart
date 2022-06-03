import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jboss_ui/models/database/type_device.dart';
import 'package:jboss_ui/models/search/search_response.dart';
part 'new_task_page_state.freezed.dart';

@freezed
class NewTaskPageState with _$NewTaskPageState {
  const factory NewTaskPageState({
    required Client client,
    required int position,
    required int dbDeviceId,
    required List<TypeDevice> listDevices,
  }) = _NewTaskPageState;
}
