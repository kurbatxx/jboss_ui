import 'package:flutter/material.dart';
import './screens/hub_page.dart';
import './screens/login_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JBOSS_UI',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginPage(), //LoginPage(),
      routes: {'/hub': (context) => const HubPage()},
    );
  }
}
