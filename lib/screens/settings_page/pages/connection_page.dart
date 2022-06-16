import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/connection_page_provider.dart';
import 'package:jboss_ui/states/connection_page_state.dart';
import 'package:jboss_ui/utils/bitsdojo.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          BitsDojoTitleBar(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFieldsWidget(),
          ),
        ],
      ),
    );
  }
}

class TextFieldsWidget extends ConsumerWidget {
  const TextFieldsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(connectionPageProvider);

    final hostTextController = TextEditingController();
    final databaseNameTextController = TextEditingController();
    final portTextController = TextEditingController();
    final usernameTextController = TextEditingController();
    final passwordTextController = TextEditingController();

    hostTextController.value = TextEditingValue(
      text: state.host,
      selection: TextSelection.collapsed(offset: state.host.length),
    );

    databaseNameTextController.value = TextEditingValue(
      text: state.databaseName,
      selection: TextSelection.collapsed(offset: state.databaseName.length),
    );

    portTextController.value = TextEditingValue(
      text: state.port,
      selection: TextSelection.collapsed(offset: state.port.length),
    );

    usernameTextController.value = TextEditingValue(
      text: state.username,
      selection: TextSelection.collapsed(offset: state.username.length),
    );

    passwordTextController.value = TextEditingValue(
      text: state.password,
      selection: TextSelection.collapsed(offset: state.password.length),
    );

    return Column(
      children: [
        TextField(
          controller: hostTextController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: 'host',
          ),
        ),
        TextField(
          controller: databaseNameTextController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: 'database',
          ),
        ),
        TextField(
          controller: portTextController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: 'port',
          ),
        ),
        TextField(
          controller: usernameTextController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: 'username',
          ),
        ),
        TextField(
          controller: passwordTextController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: 'password',
          ),
        ),
        TextButton(
          onPressed: () {
            final state = ConnectionPageState(
              host: hostTextController.text,
              databaseName: databaseNameTextController.text,
              port: portTextController.text,
              username: usernameTextController.text,
              password: passwordTextController.text,
            );

            ref
                .read(connectionPageProvider.notifier)
                .checkConnect(newState: state);
            Navigator.pop(context);
          },
          child: const Text('Подключиться'),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Выйти'),
        ),
      ],
    );
  }
}
