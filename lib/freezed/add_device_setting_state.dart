import 'package:flutter_svg/flutter_svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_device_setting_state.freezed.dart';

@freezed
class AddDeviceSettingState with _$AddDeviceSettingState {
  const factory AddDeviceSettingState({
    required String name,
    required String price,
    required SvgPicture? svgIcon,
  }) = _AddDeviceSettingState;
}
