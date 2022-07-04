import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/database.dart';
import 'package:jboss_ui/api/jboss.dart';
import 'package:jboss_ui/api/ui.dart';

import 'package:jboss_ui/navigation/main_navigation.dart';
import 'package:jboss_ui/provider/connection_page_provider.dart';
import 'package:jboss_ui/provider/login_page_providers.dart';
import 'package:jboss_ui/utils/app_dir.dart';
import 'package:jboss_ui/utils/dev_log.dart';

final appDir = getAppDir();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  JbossApi.initial();
  final loginState = await UiInitialApi.getLoginState();
  final connectionState = await UiInitialApi.getConnetionPageState();

  await DbApi.inst.init(connectionState: connectionState);
  try {
    await DbApi.inst.conn.open();
  } catch (e) {
    e.log();
    DbApi.inst.conn.close();
  }

  runApp(
    ProviderScope(
      overrides: [
        loginScreenStateProvider.overrideWithValue(
          LoginScreenStateNotifer(loginState),
        ),
        connectionPageProvider.overrideWithValue(
          ConnectionPageStateNotifier(connectionState),
        ),
      ],
      child: const App(),
    ),
  );
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(350, 550);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Devices CRM";
    win.show();
  });
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainNavigation = Navigation();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JBOSS_UI',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute,
    );
  }
}
