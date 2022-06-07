import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jboss_ui/models/database/colored_device.dart';
import 'package:jboss_ui/models/database/setting_type_device.dart';
import 'package:jboss_ui/models/database/type_device.dart';
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
    ''');

    const String rawSvg =
        '''<?xml version="1.0" ?><svg width="128px" height="128px" viewBox="0 0 128 128" id="Layer_1" style="enable-background:new 0 0 128 128;" version="1.1" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><polygon points="82.4,40 64,58.3 45.6,40 40,45.6 58.3,64 40,82.4 45.6,88 64,69.7 82.4,88 88,82.4 69.7,64 88,45.6  "/><path d="M1,127h126V1H1V127z M9,9h110v110H9V9z"/></g></svg>''';
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

    const String rawSvg =
        '''<?xml version="1.0" ?><svg width="128px" height="128px" viewBox="0 0 128 128" id="Layer_1" style="enable-background:new 0 0 128 128;" version="1.1" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><polygon points="82.4,40 64,58.3 45.6,40 40,45.6 58.3,64 40,82.4 45.6,88 64,69.7 82.4,88 88,82.4 69.7,64 88,45.6  "/><path d="M1,127h126V1H1V127z M9,9h110v110H9V9z"/></g></svg>''';
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
}
