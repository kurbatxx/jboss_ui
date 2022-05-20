import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/login_page_providers.dart';
import 'package:jboss_ui/utils/secure.dart';

enum TextControllersEnum {
  login,
  password,
}

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
              children: [
                Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/login.png"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                const LoginConsumer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginConsumer extends ConsumerWidget {
  const LoginConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = TextEditingController();
    final passwordController = TextEditingController();

    final state = ref.watch(loginScreenStateProvider);

    loginController.value = TextEditingValue(
      text: state.login,
      selection: TextSelection.collapsed(offset: state.login.length),
    );

    passwordController.value = TextEditingValue(
      text: state.password,
      selection: TextSelection.collapsed(offset: state.password.length),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: loginController,
          decoration: const InputDecoration(
            hintText: "Логин",
          ),
          onChanged: (_) =>
              ref.read(loginScreenStateProvider.notifier).updateTextField(
                    textController: loginController,
                    textControllersEnum: TextControllersEnum.login,
                  ),
        ),
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
            hintText: "Пароль",
          ),
          obscureText: true,
          onChanged: (_) =>
              ref.read(loginScreenStateProvider.notifier).updateTextField(
                    textController: passwordController,
                    textControllersEnum: TextControllersEnum.password,
                  ),
        ),
        state.login.isNotEmpty && state.password.isNotEmpty
            ? Column(
                children: [
                  CheckboxListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text("Запомнить логин и пароль"),
                    onChanged: (_) {
                      ref.read(loginScreenStateProvider.notifier).toogle();
                      SecureStorage.instance.setSaveLoginState(state.save);
                    },
                    value: state.save,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  state.isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(300, 50),
                            ),
                          ),
                          onPressed: () => ref
                              .read(loginScreenStateProvider.notifier)
                              .login(
                                  context: context,
                                  login: state.login,
                                  password: state.password),
                          child: const Text('Войти'),
                        ),
                  const SizedBox(
                    height: 24,
                  ),
                  state.error.isNotEmpty ? Text(state.error) : const SizedBox()
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
