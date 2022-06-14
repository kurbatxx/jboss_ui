import 'package:flutter_svg/flutter_svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'device_editor_setting_state.freezed.dart';

@freezed
class DeviceEditorSettingState with _$DeviceEditorSettingState {
  const factory DeviceEditorSettingState({
    required String name,
    required String price,
    required SvgPicture? svgIcon,
    required bool isColored,
    required int? typeDevice,
  }) = _DeviceEditorSettingState;
}
