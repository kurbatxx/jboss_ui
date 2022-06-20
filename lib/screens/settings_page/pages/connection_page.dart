import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/connection_page_provider.dart';
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

    return Column(
      children: [
        TextField(
          controller: state.hostController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: 'host',
          ),
        ),
        TextField(
          controller: state.databaseNameController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: 'database',
          ),
        ),
        TextField(
          controller: state.portController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: 'port',
          ),
        ),
        TextField(
          controller: state.usernameController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: 'username',
          ),
        ),
        TextField(
          controller: state.passwordController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: 'password',
          ),
        ),
        TextButton(
          onPressed: () async {
            // final state = ConnectionPageState(
            //   hostController: hostTextController.text.trim(),
            //   databaseNameController: databaseNameTextController.text.trim(),
            //   portController: portTextController.text.trim(),
            //   usernameController: usernameTextController.text.trim(),
            //   passwordController: passwordTextController.text.trim(),
            // );

            Future<bool> checkConnect = ref
                .read(connectionPageProvider.notifier)
                .checkConnect(newState: state);

            if (await checkConnect) {
              Navigator.pop(context);
            }
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
