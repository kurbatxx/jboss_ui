import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jboss_ui/models/database/colored_device.dart';
import 'package:jboss_ui/models/database/type_device.dart';
import 'package:jboss_ui/models/search/search_response.dart';
part 'new_task_page_state.freezed.dart';

@freezed
class NewTaskPageState with _$NewTaskPageState {
  const factory NewTaskPageState({
    required Client client,
    required int devicePosition,
    required int colorPosition,
    required int dbDeviceId,
    required List<TypeDevice> listDevices,
    required List<ColoredDevice> listColoredDevices,
  }) = _NewTaskPageState;
}
