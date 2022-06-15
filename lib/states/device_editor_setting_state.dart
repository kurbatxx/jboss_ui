import 'package:flutter_svg/flutter_svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jboss_ui/models/database/color_item.dart';
import 'package:jboss_ui/models/database/jboss_device_item.dart';
part 'device_editor_setting_state.freezed.dart';

@freezed
class DeviceEditorSettingState with _$DeviceEditorSettingState {
  const factory DeviceEditorSettingState({
    required bool isNewDevice,
    required String name,
    required String price,
    required SvgPicture? svgIcon,
    required bool isColored,
    required List<ColorItem> colorList,
    required JbossDeviceItem? jbossDevice,
    required List<JbossDeviceItem> jbossDevicesList,
  }) = _DeviceEditorSettingState;
}
