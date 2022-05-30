import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/screens/settings_page/settings_page.dart';

class ColorsPage extends ConsumerWidget {
  const ColorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              ref.read(settingNavigationProvider.state).state =
                  SettingsScreenOption.availableColors;
            },
            child: const Text('Назад'),
          ),
        ],
      ),
      Expanded(
        child: ListView(
          children: [
            Container(
              height: 50,
              width: 200,
              color: Colors.red,
            )
          ],
        ),
      )
    ]);
  }
}
