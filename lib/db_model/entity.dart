import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Settings {
  int id;
  String appDir;

  Settings({
    this.id = 0,
    this.appDir = "",
  });
}

@Entity()
class DeviceColor {
  int id;
  Color color;

  //final customer = ToOne<Customer>();

  DeviceColor({
    this.id = 0,
    this.color = Colors.white,
  });
}

@Entity()
class Device {
  int id;
  IconData icon;
  String name;
  int price;
  bool colored;
  DeviceColor? deviceColor;

  Device({
    this.id = 0,
    this.icon = Icons.ten_k_rounded,
    required this.name,
    required this.price,
    required this.colored,
    this.deviceColor,
  });
}
