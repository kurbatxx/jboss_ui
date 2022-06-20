import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/navigation/main_navigation.dart';
import 'package:jboss_ui/provider/login_page_providers.dart';
import 'package:jboss_ui/utils/bitsdojo.dart';
import 'package:jboss_ui/utils/secure.dart';

enum LoginScreenFieldEnum {
  login,
  password,
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BitsDojoTitleBar(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Column(
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
                          height: 24.0,
                        ),
                        const LoginConsumer(),
                      ],
                    ),
                    IconButton(
                      splashRadius: 16,
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(NavigationRouteNames.connetionPage);
                      },
                      icon: const Icon(
                        Icons.settings,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginConsumer extends ConsumerWidget {
  const LoginConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginScreenStateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: state.loginController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: "Логин",
          ),
          onChanged: (value) =>
              ref.read(loginScreenStateProvider.notifier).updateText(
                    controller: state.loginController,
                    field: LoginScreenFieldEnum.login,
                  ),
        ),
        TextFormField(
          controller: state.passwordController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: "Пароль",
          ),
          obscureText: true,
          onChanged: (_) => ref
              .read(
                loginScreenStateProvider.notifier,
              )
              .updateText(
                controller: state.passwordController,
                field: LoginScreenFieldEnum.password,
              ),
        ),
        state.loginController.text.isNotEmpty &&
                state.passwordController.text.isNotEmpty
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
                                  login: state.loginController.text,
                                  password: state.passwordController.text),
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
