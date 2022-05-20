import 'package:flutter/material.dart';

import 'package:jboss_ui/screens/hub_screen/hub_screen.dart';
import 'package:jboss_ui/screens/login_page/login_page.dart';
import 'package:jboss_ui/screens/register_device_page/register_device_page.dart';
import 'package:jboss_ui/screens/settings_page/settings_page.dart';

abstract class NavigationRouteNames {
  static const loginScreen = '/';
  static const hubScreen = '/hub';
  static const settingsScreen = '/settings';
  static const registerCardScreen = '/register_card';
}

class Navigation {
  final initialRoute = NavigationRouteNames.loginScreen;

  final routes = <String, Widget Function(BuildContext)>{
    NavigationRouteNames.loginScreen: (context) => const LoginPage(),
    NavigationRouteNames.hubScreen: (context) => const HubScreen(),
    NavigationRouteNames.settingsScreen: (context) => const SettingsPage(),
    NavigationRouteNames.registerCardScreen: (context) =>
        const RegisterDevicePage(),
  };
}
