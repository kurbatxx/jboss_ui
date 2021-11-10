import 'package:flutter/material.dart';
import 'package:jboss_ui/screens/hub_page/hub_page.dart';
import 'package:jboss_ui/screens/login_page/login_page.dart';

abstract class MainNavigationRouteNames {
  static const loginPageScreen = '/';
  static const hubPage = '/hub';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.loginPageScreen;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loginPageScreen: (context) => const LoginPage(),
    MainNavigationRouteNames.hubPage: (context) => const HubPage(),
  };
}
