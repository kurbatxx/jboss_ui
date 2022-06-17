import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/models/database/color_item.dart';
import 'package:jboss_ui/screens/settings_page/pages/device_editor_settings_page.dart';
import 'package:jboss_ui/states/device_editor_setting_state.dart';

final deviceEditorScreenProvider = StateNotifierProvider<
    DeviceEditorSettingStateNotifer, DeviceEditorSettingState>(
  (ref) => DeviceEditorSettingStateNotifer(
    const DeviceEditorSettingState(
      isNewDevice: true,
      isColored: false,
      colorList: [],
      name: '',
      price: '',
      svgIcon: null,
      jbossDevice: null,
      jbossDevicesList: [],
    ),
  ),
);

class DeviceEditorSettingStateNotifer
    extends StateNotifier<DeviceEditorSettingState> {
  DeviceEditorSettingStateNotifer(
    DeviceEditorSettingState state,
  ) : super(state);

  void updateSvgIcon({required SvgPicture svgIcon}) {
    state = state.copyWith(svgIcon: svgIcon);
  }

  void clearSvg() {
    state = state.copyWith(svgIcon: null);
  }

  void coloredToogle() {
    state = state.copyWith(isColored: !state.isColored);
  }

  void getJbossDevices() async {
    final jbossDevices = await DbApi.getJbossDevices();
    state = state.copyWith(jbossDevicesList: jbossDevices);
  }

  setJbossDevice({required int position}) {
    state = state.copyWith(jbossDevice: state.jbossDevicesList[position]);
  }

  void updateSelectedColors({required List<ColorItem> selectedColors}) {
    state = state.copyWith(colorList: selectedColors);
  }

  void updateText(
    String value, {
    required DeviceEditorSettingsTextEnum field,
  }) {
    switch (field) {
      case DeviceEditorSettingsTextEnum.name:
        state = state.copyWith(name: value);
        break;
      case DeviceEditorSettingsTextEnum.price:
        state = state.copyWith(price: value);
        break;
    }
    state = state.copyWith(svgIcon: null);
  }
}
