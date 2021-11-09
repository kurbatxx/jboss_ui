import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/freezed/authorization_state.dart';

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
                const AuthorizationFields(),
                const SaveLoginPasswordWidget(),
                const LoginButton()
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
      onChanged: (value) => ref
          .read(loginPasswordCheckboxProvider.state)
          .state = value ?? false != value,
      value: loginPasswordCheckboxState,
    );
  }
}

class LoginButton extends ConsumerWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider.state).state;
    final passwordForm = ref.watch(passwordFormProvider.state).state;
    bool showButton = loginForm.field.isEmpty || passwordForm.field.isEmpty;

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
                      ref.read(authorizationProvider.notifier).login(),
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
      data: () => Text("Авторизовался"),
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
                      ref.read(authorizationProvider.notifier).login(),
                  child: const Text('Войти'),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
