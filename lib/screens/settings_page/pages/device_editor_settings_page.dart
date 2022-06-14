import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jboss_ui/screens/settings_page/pages/overlay_menu.dart';
import 'package:jboss_ui/provider/device_editor_setting_provider.dart';
import 'dart:io';

import 'package:jboss_ui/screens/settings_page/settings_page.dart';
import 'package:jboss_ui/utils/constant.dart';

class DeviceEditorSettingsPage extends ConsumerWidget {
  const DeviceEditorSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deviceEditorScreenProvider);
    final containerKey = GlobalKey();
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
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 80,
                      child: DevicesIconsWidget(),
                    ),
                    Expanded(
                      key: containerKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'Название устройства',
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'Цена устройства',
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                final RenderBox renderBox = containerKey
                                    .currentContext
                                    ?.findRenderObject() as RenderBox;

                                containerKey.currentContext?.size;
                                final Size size = renderBox.size;
                                print('Size: ${size.width}, ${size.height}');
                                final Offset offset =
                                    renderBox.localToGlobal(Offset.zero);
                                print('Offset: ${offset.dx}, ${offset.dy}');
                                print(
                                    'Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
                                OverlayMenu.showMenu(context: context);
                                ref
                                    .read(deviceEditorScreenProvider.notifier)
                                    .getJbossDevices();
                              },
                              child: const Text('Тип устройства'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            ref
                                .read(deviceEditorScreenProvider.notifier)
                                .coloredToogle();
                          },
                          child: Row(
                            children: [
                              state.isColored
                                  ? const Icon(Icons.check_box)
                                  : const Icon(
                                      Icons.check_box_outline_blank_rounded),
                              const Center(
                                child: Text('Несколько цветов'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    state.isColored
                        ? TextButton(
                            onPressed: () {},
                            child: const Text('Указать цвета'),
                          )
                        : const SizedBox(),
                    const Divider(),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Сохранить устройство'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DevicesIconsWidget extends ConsumerWidget {
  const DevicesIconsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deviceEditorScreenProvider);

    return Column(
      children: [
        state.svgIcon == null
            ? TextButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['svg'],
                  );

                  if (result != null) {
                    File file = File(result.files.single.name);
                    final svgIcon = SvgPicture.file(file);
                    ref
                        .read(deviceEditorScreenProvider.notifier)
                        .updateSvgIcon(svgIcon: svgIcon);
                  }
                },
                child: const Text('Выбрать\n иконку'),
              )
            : Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
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
                                    final svgIcon = SvgPicture.file(file);
                                    ref
                                        .read(
                                            deviceEditorScreenProvider.notifier)
                                        .updateSvgIcon(svgIcon: svgIcon);
                                  }
                                },
                                child: Center(
                                  child: state.svgIcon ?? const SizedBox(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                    width: 16,
                    child: ClipRRect(
                      borderRadius: kMinimumRadius,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            ref
                                .read(deviceEditorScreenProvider.notifier)
                                .clearSvg();
                          },
                          child: Ink(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ],
    );
  }
}
