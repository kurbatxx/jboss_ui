import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

import 'package:jboss_ui/provider/settings_page_providers.dart';
import 'package:jboss_ui/screens/settings_page/settings_page.dart';
import 'package:jboss_ui/utils/constant.dart';

class AddDevicesSettingsPage extends ConsumerWidget {
  const AddDevicesSettingsPage({Key? key}) : super(key: key);

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
                    SettingsScreenOption.devices;
              },
              child: const Text('Назад'),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: kMinimumRadius,
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Column(
                    children: const [DevicesIconsWidget()],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Название устройства'),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Цена устройства'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Тип устройства'),
                      ),
                      TextButton(
                        onPressed: () {
                          ref.read(settingNavigationProvider.state).state =
                              SettingsScreenOption.availableColors;
                        },
                        child: const Text('Выбрать цвета'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Сохранить устройство'),
            ),
          ],
        )
      ],
    );
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
            ? TextButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['svg'],
                  );

                  if (result != null) {
                    File file = File(result.files.single.name);
                    ref.read(svgFileProvider.state).state = file;
                  }
                },
                child: const Text('Выбрать\n иконку'),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: ClipRRect(
                      borderRadius: kMinimumRadius,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['svg'],
                            );

                            if (result != null) {
                              File file = File(result.files.single.name);
                              ref.read(svgFileProvider.state).state = file;
                            }
                          },
                          child: Center(
                            child: SvgPicture.file(
                              fit: BoxFit.fitWidth,
                              width: 50,
                              svgFile,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
