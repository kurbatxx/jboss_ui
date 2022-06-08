import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/color_list_page_provider.dart';
import 'package:jboss_ui/screens/settings_page/settings_page.dart';

class AvailableColorsPage extends ConsumerWidget {
  const AvailableColorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                ref.read(settingNavigationProvider.state).state =
                    SettingsScreenOption.addDevice;
              },
              child: const Text('Назад'),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            ref.read(settingNavigationProvider.state).state =
                SettingsScreenOption.addColors;
            ref.read(colorsListPageProvider.notifier).getColors();
          },
          child: const Text('Добавить новый цвет'),
        )
      ],
    );
  }
}
