import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jboss_ui/models/database/color_item.dart';
import 'package:jboss_ui/models/database/colored_device.dart';
import 'package:jboss_ui/models/database/jboss_device_item.dart';
import 'package:jboss_ui/models/database/setting_type_device.dart';
import 'package:jboss_ui/models/database/type_device.dart';
import 'package:jboss_ui/states/connection_page_state.dart';
import 'package:jboss_ui/utils/constant.dart';
import 'package:jboss_ui/utils/dev_log.dart';
import 'package:postgres/postgres.dart';

class DbApi {
  late PostgreSQLConnection conn;

  DbApi._();
  static DbApi? _instance;
  static DbApi get inst => _instance ??= DbApi._();

  init({required ConnectionPageState connectionState}) async {
    await Future.delayed(const Duration(seconds: 2));
    conn = PostgreSQLConnection(
      connectionState.hostController.text.trim(),
      int.tryParse(connectionState.portController.text.trim()) ?? 5432,
      connectionState.databaseNameController.text.trim(),
      username: connectionState.usernameController.text.trim(),
      password: connectionState.passwordController.text.trim(),
      useSSL: true,
    );
  }

  static Future<List<TypeDevice>> getDevices() async {
    final results = await DbApi.inst.conn.query('''
    select type_devices.type_device_id, type_device_name, type_device_icon 
    from ( 
        select  
        distinct type_device_id
        from devices
        where availability = true
      ) 
      as d
    join type_devices on type_devices.type_device_id = d.type_device_id
    order by device_position;
    ''');

    final svgIcon = SvgPicture.string(kRawSvg);
    List<TypeDevice> devices = [];

    for (List device in results) {
      final typeDevice = TypeDevice(
        typeDeviceId: device[0],
        deviceName: device[1],
        svgIcon: device[2] != null ? SvgPicture.string(device[2]) : svgIcon,
      );

      devices.add(typeDevice);
    }
    return devices;
  }

  static Future<List<ColoredDevice>> getColors(
      {required int typeDeviceId}) async {
    final results = await DbApi.inst.conn.query('''
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
    final results = await DbApi.inst.conn.query('''
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
    final results = await DbApi.inst.conn.query('''
    select type_device_id, device_position, type_device_name, device_name, price, type_device_icon
    from type_devices
    join jboss_devices on type_devices.jboss_device_id = jboss_devices.jboss_device_id
    order by device_position;
    ''');

    final svgIcon = SvgPicture.string(kRawSvg);
    List<SettingTypeDevice> settingDevices = [];

    for (List device in results) {
      final settingDevice = SettingTypeDevice(
        typeDeviceId: device[0],
        devicePosition: device[1],
        typeDeviceName: device[2],
        deviceName: device[3],
        price: device[4],
        svgIcon: device[5] != null ? SvgPicture.string(device[5]) : svgIcon,
      );

      settingDevices.add(settingDevice);
    }
    return settingDevices;
  }

  static Future<void> updateTypeDevicePosition({
    required int oldPosition,
    required int newPosition,
  }) async {
    await DbApi.inst.conn.query('''
    select 
    from update_type_device_position($oldPosition, $newPosition);
    ''');
  }

  static Future<List<ColorItem>> getColorItems() async {
    final results = await DbApi.inst.conn.query('''
    select color_id, color
    from colors 
    order by color_position;
    ''');

    List<ColorItem> colorItems = [];
    for (List item in results) {
      final colorItem = ColorItem(
        colorId: item[0],
        color: Color(item[1]),
      );
      colorItems.add(colorItem);
    }
    return colorItems;
  }

  static Future<void> addColor({required Color color}) async {
    await DbApi.inst.conn.query('''
    insert into colors (color_position, color)
    values (
	         (select count(color_position)
		        from colors
	         ), ${color.value});
    ''');
  }

  static Future<void> deleteColor({required int id}) async {
    try {
      await DbApi.inst.conn.query('''
          select 
          detele_color($id);
          ''');
    } catch (e) {
      '--##--'.log();
      e.log();
    }
  }

  static Future<List<JbossDeviceItem>> getJbossDevices() async {
    final results = await DbApi.inst.conn.query('''
    select jboss_device_id, device_name, device_selected
    from jboss_devices
    where device_selected = false 
    order by jboss_device_id;
    ''');

    List<JbossDeviceItem> jbossDevices = [];

    for (List device in results) {
      final jbossDevice = JbossDeviceItem(
        id: device[0],
        name: device[1],
        selected: device[2],
      );

      jbossDevices.add(jbossDevice);
    }
    return jbossDevices;
  }

  static Future<void> createNewDevice(
      {required String name,
      required int jbossId,
      required int price,
      required String rawSvg,
      required List<ColorItem> colorsList}) async {
    final icon = rawSvg.isNotEmpty ? rawSvg : 'null';

    String colors = '{}';
    if (colorsList.isNotEmpty) {
      List<int> list = [];
      for (final i in colorsList) {
        list.add(i.colorId);
      }
      colors = list.toString().replaceFirst('[', '{').replaceFirst(']', '}');
    }

    try {
      await DbApi.inst.conn.query('''
      select
      from create_new_device('$name', $jbossId, $price, '$icon', '$colors');
      ''');
    } catch (e) {
      '--#######--'.log();
      e.log();
    }
  }
}
