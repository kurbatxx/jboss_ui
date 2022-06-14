import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jboss_ui/states/device_editor_setting_state.dart';

final registerDeviceScreenProvider = StateNotifierProvider<
    DeviceEditorSettingStateNotifer, DeviceEditorSettingState>(
  (ref) => DeviceEditorSettingStateNotifer(
    const DeviceEditorSettingState(
      isColored: false,
      name: '',
      price: '',
      svgIcon: null,
      typeDevice: null,
    ),
  ),
);

class DeviceEditorSettingStateNotifer
    extends StateNotifier<DeviceEditorSettingState> {
  DeviceEditorSettingStateNotifer(
    DeviceEditorSettingState state,
  ) : super(state);

  updateSvgIcon({required SvgPicture svgIcon}) {
    state = state.copyWith(svgIcon: svgIcon);
  }

  clearSvg() {
    state = state.copyWith(svgIcon: null);
  }

  void coloredToogle() {
    state = state.copyWith(isColored: !state.isColored);
  }
}
