import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/model/login.dart';
import 'package:jboss_ui/screens/hub_page.dart';

import '../provider/data_provider.dart';
//import '../util/constant.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(loginCheckboxProvider);
    final checkboxState = provider.state;

    final refLogin = ref.watch(loginProvider);
    final loginProviderState = refLogin.state;

    final futureLogin = ref.watch(futureLoginProvider);
    final loginFormData = ref.watch(loginFormDataProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 300.0,
                height: 300.0,
                //color: Colors.red,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/login.png"),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(),
                  TextField(),
                  loginProviderState == false
                      ? const SizedBox(
                          height: 48.0,
                        )
                      : Center()
                ],
              ),

              //Flexible(child: Text("Запомнить логин и пароль")),
              CheckboxListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Запомнить логин и пароль"),
                //splashRadius: kCheckboxRadius,
                value: checkboxState,
                onChanged: (value) {
                  final provider = ref.read(loginCheckboxProvider);
                  provider.state = !provider.state;
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(200, 50),
                      ),
                    ),
                    onPressed: () {
                      final provider = ref.read(loginProvider);
                      provider.state = true;

                      final mloginProvider = ref.read(loginFormDataProvider);
                      mloginProvider.state =
                          Autorization(login: "", password: "");

                      //Navigator.of(context).pushNamed('/hub');
                    },
                    child: const Text('Войти'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
