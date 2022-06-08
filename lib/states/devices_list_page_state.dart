import 'package:jboss_ui/models/database/setting_type_device.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'devices_list_page_state.freezed.dart';

@freezed
class DevicesListPageState with _$DevicesListPageState {
  const factory DevicesListPageState({
    required List<SettingTypeDevice> devices,
  }) = _DevicesListPageState;
}
