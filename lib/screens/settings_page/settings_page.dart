import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

import 'package:jboss_ui/provider/settings_page_providers.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Назад'))
              ],
            ),
            Column(
              children: [
                const DevicesIconsWidget(),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Название устройства'),
                ),
                TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Цена устройства')),
                const ColoredDeviceSwitcherWidget(),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Добавить устройство'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ColoredDeviceSwitcherWidget extends ConsumerWidget {
  const ColoredDeviceSwitcherWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colored = ref.watch(isColoredDeviceProvider.state).state;

    return CheckboxListTile(
        title: const Text('Разных цветов'),
        value: colored,
        onChanged: (value) {
          final checkboxState = value ?? false != value;
          ref.read(isColoredDeviceProvider.state).state = checkboxState;
        });
  }
}

class DevicesIconsWidget extends ConsumerWidget {
  const DevicesIconsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final svgFile = ref.watch(svgFileProvider.state).state;

    return Column(
      children: [
        svgFile == null
            ? ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['svg'],
                  );

                  if (result != null) {
                    File file = File(result.files.single.name);
                    ref.read(svgFileProvider.state).state = file;
                    //print(file.readAsStringSync());
                  } else {
                    print('Ничего не выбрано');
                  }
                },
                child: const Text('Добавить иконку устройства'),
              )
            : Column(
                children: [
                  SvgPicture.file(
                    svgFile,
                    height: 100,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(svgFileProvider.state).state = null;
                      },
                      child: Text('Удалить иконку'))
                ],
              ),
      ],
    );
  }
}
