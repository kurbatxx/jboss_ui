import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/models/database/color_item.dart';
import 'package:jboss_ui/screens/settings_page/pages/device_editor_settings_page.dart';
import 'package:jboss_ui/states/device_editor_setting_state.dart';
import 'package:jboss_ui/utils/constant.dart';
import 'package:jboss_ui/utils/dev_log.dart';

final deviceEditorScreenProvider = StateNotifierProvider<
    DeviceEditorSettingStateNotifer, DeviceEditorSettingState>(
  (ref) => DeviceEditorSettingStateNotifer(
    DeviceEditorSettingState(
      isNewDevice: true,
      isColored: false,
      colorList: [],
      nameController: TextEditingController(),
      priceController: TextEditingController(),
      rawSvg: '',
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

  void initial() {
    state = state.copyWith(
      isNewDevice: true,
      isColored: false,
      colorList: [],
      nameController: TextEditingController(),
      priceController: TextEditingController(),
      rawSvg: '',
      svgIcon: null,
      jbossDevice: null,
      jbossDevicesList: [],
    );
  }

  void updateSvgIcon({required String rawSvg}) {
    SvgPicture svgIcon = SvgPicture.string(kRawSvg);
    try {
      svgIcon = SvgPicture.string(rawSvg);
    } catch (e) {
      e.log();
    }
    state = state.copyWith(
      svgIcon: svgIcon,
      rawSvg: rawSvg,
    );
  }

  void clearSvg() {
    state = state.copyWith(
      svgIcon: null,
      rawSvg: '',
    );
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

  void updateText({
    required TextEditingController controller,
    required DeviceEditorSettingsTextEnum field,
  }) {
    switch (field) {
      case DeviceEditorSettingsTextEnum.name:
        state = state.copyWith(nameController: controller);
        break;
      case DeviceEditorSettingsTextEnum.price:
        state = state.copyWith(priceController: controller);
        break;
    }
  }

  Future<bool> createNewDevice() async {
    try {
      await DbApi.createNewDevice(
        name: state.nameController.text.trim(),
        price: int.tryParse(state.priceController.text.trim()) ?? 0,
        jbossId: state.jbossDevice?.id ?? 0,
        rawSvg: state.rawSvg,
        colorsList: state.colorList,
      );
      return true;
    } catch (e) {
      e.log();
    }
    return false;
  }
}
