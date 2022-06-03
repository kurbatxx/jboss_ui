import 'package:flutter_svg/svg.dart';

class TypeDevice {
  final int typeDeviceId;
  final String deviceName;
  final SvgPicture svgIcon;

  TypeDevice({
    required this.typeDeviceId,
    required this.deviceName,
    required this.svgIcon,
  });
}
