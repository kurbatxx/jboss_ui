import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/data_provider.dart';
import '../util/constant.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final provider = watch(loginCheckboxProvider);
    final checkboxState = provider.state;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 200.0,
                height: 200.0,
                color: Colors.red,
              ),
              const SizedBox(
                height: 48.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TextField(),
                  const TextField(),
                  const SizedBox(
                    height: 48.0,
                  ),
                  Row(children: [
                    Checkbox(
                        splashRadius: kCheckboxRadius,
                        value: checkboxState,
                        onChanged: (value) {
                          final provider = context.read(loginCheckboxProvider);
                          provider.state = !provider.state;
                        }),
                    Flexible(child: Text("Запомнить логин и пароль")),
                  ]),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/hub');
                    },
                    child: const Text('Войти'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
