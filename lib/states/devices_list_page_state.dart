import 'package:jboss_ui/models/database/setting_type_device.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'devices_list_page_state.freezed.dart';

@freezed
class DeviicesListPageState with _$DeviicesListPageState {
  const factory DeviicesListPageState({
    required List<SettingTypeDevice> devices,
  }) = _DeviicesListPageState;
}
