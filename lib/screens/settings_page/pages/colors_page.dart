import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/color_list_page_provider.dart';
import 'package:jboss_ui/screens/settings_page/settings_page.dart';

class ColorsPage extends ConsumerWidget {
  const ColorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(colorsListPageProvider);
    return Column(
      children: [
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
        state.colorsList.isEmpty
            ? const SizedBox()
            : Expanded(
                child: ListView.builder(
                  itemCount: state.colorsList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 50,
                          width: 200,
                          color: state.colorsList[index].color,
                        ),
                        const SizedBox(
                          height: 2.0,
                        )
                      ],
                    );
                  },
                ),
              )
      ],
    );
  }
}
