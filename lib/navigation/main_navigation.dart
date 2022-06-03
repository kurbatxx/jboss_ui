import 'package:flutter/material.dart';

import 'package:jboss_ui/screens/hub_screen/hub_screen.dart';
import 'package:jboss_ui/screens/login_screen/login_screen.dart';

abstract class NavigationRouteNames {
  static const loginScreen = '/';
  static const hubScreen = '/hub';
}

class Navigation {
  final initialRoute = NavigationRouteNames.loginScreen;

  final routes = <String, Widget Function(BuildContext)>{
    NavigationRouteNames.loginScreen: (context) => const LoginScreen(),
    NavigationRouteNames.hubScreen: (context) => const HubScreen(),
  };
}
