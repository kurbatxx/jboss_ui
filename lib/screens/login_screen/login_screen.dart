import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/navigation/main_navigation.dart';
import 'package:jboss_ui/provider/login_page_providers.dart';
import 'package:jboss_ui/utils/bitsdojo.dart';
import 'package:jboss_ui/utils/secure.dart';

enum TextControllersEnum {
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

    final loginController = TextEditingController();
    final passwordController = TextEditingController();

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
