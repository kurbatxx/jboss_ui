import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jboss_ui/models/database/colored_device.dart';
import 'package:jboss_ui/models/database/setting_type_device.dart';
import 'package:jboss_ui/models/database/type_device.dart';
import 'package:jboss_ui/utils/constant.dart';
import 'package:postgres/postgres.dart';

class DbApi {
  static DbApi instance = DbApi._();
  DbApi._();
  final PostgreSQLConnection conn = initial();

  static initial() {
    return PostgreSQLConnection(
      'localhost',
      5432,
      'crm_db',
      username: 'postgres',
      password: 'postgres',
    );
  }

  static Future<List<TypeDevice>> getDevices() async {
    final results = await DbApi.instance.conn.query('''
    select * from type_devices
    order by device_position;
    ''');

    final svgIcon = SvgPicture.string(rawSvg);
    List<TypeDevice> devices = [];

    for (List device in results) {
      final typeDevice = TypeDevice(
          typeDeviceId: device[0],
          deviceName: device[1],
          svgIcon: device[4] ?? svgIcon);

      devices.add(typeDevice);
    }
    return devices;
  }

  static Future<List<ColoredDevice>> getColors(
      {required int typeDeviceId}) async {
    final results = await DbApi.instance.conn.query('''
    select devices.device_id, colors.color 
    from devices
    join colors ON colors.color_id = devices.color_id
    where type_device_id = $typeDeviceId and availability = true
    order by color_position;
    ''');

    List<ColoredDevice> coloredDevices = [];

    for (List dbColoredDevice in results) {
      final coloredDevice = ColoredDevice(
        deviceId: dbColoredDevice[0],
        color: Color(
          dbColoredDevice[1],
        ),
      );

      coloredDevices.add(coloredDevice);
    }
    return coloredDevices;
  }

  static Future<int> setColoredDevicesId({required int typeDeviceId}) async {
    final results = await DbApi.instance.conn.query('''
    select devices.device_id
    from devices
    where type_device_id = $typeDeviceId;
    ''');

    int coloredId = 0;
    for (List dbColoredDevice in results) {
      coloredId = dbColoredDevice[0];
    }
    return coloredId;
  }

  static Future<List<SettingTypeDevice>> getSettingDevices() async {
    final results = await DbApi.instance.conn.query('''
    select type_device_id, device_position, type_device_name, device_name, price, type_device_icon
    from type_devices
    join jboss_devices on type_devices.jboss_device_id = jboss_devices.jboss_device_id
    order by device_position;
    ''');

    final svgIcon = SvgPicture.string(rawSvg);
    List<SettingTypeDevice> settingDevices = [];

    for (List device in results) {
      final settingDevice = SettingTypeDevice(
        typeDeviceId: device[0],
        devicePosition: device[1],
        typeDeviceName: device[2],
        deviceName: device[3],
        price: device[4],
        svgIcon: device[5] ?? svgIcon,
      );

      settingDevices.add(settingDevice);
    }
    return settingDevices;
  }

  static Future<void> updateTypeDevicePosition({
    required int oldPosition,
    required int newPosition,
  }) async {
    await DbApi.instance.conn.query('''
    select 
    from update_type_device_position($oldPosition, $newPosition);
    ''');
  }
}
