import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/navigation/main_navigation.dart';
import 'package:jboss_ui/provider/login_page_providers.dart';
import 'package:jboss_ui/provider/search_page_providers.dart';
import 'package:jboss_ui/utils/secure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool saveLoginState = await SecureStorage.instance.getSaveLoginState();
  bool showDeleteState = await SecureStorage.instance.getShowDeleteState();

  String login = '';
  String password = '';
  if (saveLoginState) {
    login = await SecureStorage.instance.getLogin();
    password = await SecureStorage.instance.getPassword();
  }

  runApp(
    ProviderScope(
      overrides: [
        loginPasswordCheckboxProvider
            .overrideWithProvider(StateProvider<bool>((ref) => saveLoginState)),
        deletePersonSwitcherProvider.overrideWithProvider(
            StateProvider<bool>((ref) => showDeleteState)),
        loginFormProvider.overrideWithProvider(
            StateProvider((ref) => TextFormProperties(login, null))),
        passwordFormProvider.overrideWithProvider(
            StateProvider((ref) => TextFormProperties(password, null))),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainNavigation = MainNavigation();
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
