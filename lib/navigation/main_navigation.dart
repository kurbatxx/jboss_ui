import 'package:flutter/material.dart';
import 'package:jboss_ui/screens/hub_page/hub_page.dart';
import 'package:jboss_ui/screens/login_page/login_page.dart';

abstract class MainNavigationRouteNames {
  static const loginScreen = '/';
  static const hubScreen = '/hub';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.loginScreen;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loginScreen: (context) => const LoginPage(),
    MainNavigationRouteNames.hubScreen: (context) => const HubPage(),
  };
}
