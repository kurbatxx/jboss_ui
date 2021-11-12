import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:jboss_ui/screens/hub_page/hub_page.dart';
import 'package:jboss_ui/utils/secure.dart';

import '../../provider/providers.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 250.0,
                  height: 250.0,
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
                const AuthorizationFields(),
                const SaveLoginPasswordWidget(),
                const LoginButtonSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthorizationFields extends ConsumerWidget {
  const AuthorizationFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider.state).state;
    final passwordForm = ref.watch(passwordFormProvider.state).state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Логин",
            errorText: loginForm.error,
          ),
          onChanged: (value) => ref.read(loginFormProvider.state).state =
              loginForm.updateField(value),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Пароль",
            errorText: passwordForm.error,
          ),
          obscureText: true,
          onChanged: (value) => ref.read(passwordFormProvider.state).state =
              passwordForm.updateField(value),
        ),
      ],
    );
  }
}

class SaveLoginPasswordWidget extends ConsumerWidget {
  const SaveLoginPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginPasswordCheckboxState =
        ref.watch(loginPasswordCheckboxProvider.state).state;
    return CheckboxListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text("Запомнить логин и пароль"),
      onChanged: (value) {
        bool state = value ?? false != value;
        ref.read(loginPasswordCheckboxProvider.state).state = state;
        SecureStorage.instance.setSaveLoginState(state);
      },
      value: loginPasswordCheckboxState,
    );
  }
}

class LoginButtonSection extends ConsumerWidget {
  const LoginButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider.state).state;
    print(loginForm);
    final passwordForm = ref.watch(passwordFormProvider.state).state;
    bool showButton = loginForm.text.isEmpty || passwordForm.text.isEmpty;

    final authorizationState = ref.watch(authorizationProvider);

    return authorizationState.when(
      initial: () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32.0,
          ),
          !showButton
              ? ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      const Size(300, 50),
                    ),
                  ),
                  onPressed: () =>
                      ref.read(authorizationProvider.notifier).login(context),
                  child: const Text('Войти'),
                )
              : const SizedBox(),
        ],
      ),
      loading: () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(
            height: 32.0,
          ),
          CircularProgressIndicator()
        ],
      ),
      data: () => const SizedBox(
        height: 32.0,
      ),
      error: (value) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 32.0,
            child: Center(
              child: Text(value),
            ),
          ),
          !showButton
              ? ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      const Size(300, 50),
                    ),
                  ),
                  onPressed: () =>
                      ref.read(authorizationProvider.notifier).login(context),
                  child: const Text('Войти'),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
