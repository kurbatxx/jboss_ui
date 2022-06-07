import 'package:flutter_svg/flutter_svg.dart';

class SettingTypeDevice {
  final int typeDeviceId;
  final int devicePosition;
  final String typeDeviceName;
  final String deviceName;
  final int price;
  final SvgPicture svgIcon;

  SettingTypeDevice({
    required this.typeDeviceId,
    required this.devicePosition,
    required this.typeDeviceName,
    required this.deviceName,
    required this.price,
    required this.svgIcon,
  });
}
