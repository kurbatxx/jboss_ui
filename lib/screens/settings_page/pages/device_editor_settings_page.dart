import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jboss_ui/provider/color_list_page_provider.dart';
import 'package:jboss_ui/provider/device_list_page_provider.dart';
import 'package:jboss_ui/screens/settings_page/pages/overlay_menu.dart';
import 'package:jboss_ui/provider/device_editor_setting_provider.dart';
import 'dart:io';

import 'package:jboss_ui/screens/settings_page/settings_page.dart';
import 'package:jboss_ui/utils/constant.dart';

enum DeviceEditorSettingsTextEnum {
  name,
  price,
}

class DeviceEditorSettingsPage extends ConsumerWidget {
  const DeviceEditorSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deviceEditorScreenProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                ref.read(settingNavigationProvider.state).state =
                    SettingsScreenOption.devices;
                ref.read(deviceListPageProvider.notifier).getDevices();
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
                  children: const [
                    SizedBox(
                      width: 80,
                      child: DevicesIconsWidget(),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: TextFieldsWidget(),
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
                        ? state.colorList.isEmpty
                            ? TextButton(
                                onPressed: () {
                                  ref
                                      .read(settingNavigationProvider.state)
                                      .state = SettingsScreenOption.addColors;
                                  ref
                                      .read(colorsListPageProvider.notifier)
                                      .getColors();
                                },
                                child: const Text('Указать цвета'),
                              )
                            : Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Wrap(
                                      spacing: 2,
                                      runSpacing: 2,
                                      children: List.generate(
                                        state.colorList.length,
                                        (index) => ClipRRect(
                                          borderRadius: kMinimumRadius,
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            color: state.colorList[index].color,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: kMinimumRadius,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(onTap: () {
                                          ref
                                                  .read(
                                                      settingNavigationProvider
                                                          .state)
                                                  .state =
                                              SettingsScreenOption.addColors;
                                          ref
                                              .read(colorsListPageProvider
                                                  .notifier)
                                              .getColors();
                                        }),
                                      ),
                                    ),
                                  )
                                ],
                              )
                        : const SizedBox(),
                    const Divider(),
                    state.nameController.text.trim().isNotEmpty &&
                            state.priceController.text.trim().isNotEmpty &&
                            state.jbossDevice != null
                        ? TextButton(
                            onPressed: () async {
                              final createdDevice = ref
                                  .read(deviceEditorScreenProvider.notifier)
                                  .createNewDevice();
                              if (await createdDevice) {
                                ref
                                    .read(settingNavigationProvider.state)
                                    .state = SettingsScreenOption.devices;
                                ref
                                    .read(deviceListPageProvider.notifier)
                                    .getDevices();
                              }
                            },
                            child: const Text('Сохранить устройство'),
                          )
                        : const SizedBox()
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

class TextFieldsWidget extends ConsumerWidget {
  const TextFieldsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deviceEditorScreenProvider);
    final containerKey = GlobalKey();

    return Column(
      children: [
        TextFormField(
          controller: state.nameController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: 'Название устройства',
          ),
          onChanged: (_) => {
            ref.read(deviceEditorScreenProvider.notifier).updateText(
                  controller: state.nameController,
                  field: DeviceEditorSettingsTextEnum.name,
                ),
          },
        ),
        TextFormField(
          controller: state.priceController,
          decoration: const InputDecoration(
            isDense: true,
            hintText: 'Цена устройства',
          ),
          onChanged: (_) => {
            ref.read(deviceEditorScreenProvider.notifier).updateText(
                  controller: state.priceController,
                  field: DeviceEditorSettingsTextEnum.price,
                ),
          },
        ),
        const SizedBox(
          height: 2,
        ),
        SizedBox(
          width: double.infinity,
          key: containerKey,
          child: TextButton(
              onPressed: () {
                final RenderBox renderBox = containerKey.currentContext
                    ?.findRenderObject() as RenderBox;

                final Size size = renderBox.size;
                final Offset offset = renderBox.localToGlobal(Offset.zero);

                OverlayMenu.showMenu(
                  context: context,
                  widgetSize: size,
                  offset: offset,
                );
                ref.read(deviceEditorScreenProvider.notifier).getJbossDevices();
              },
              child: state.jbossDevice == null
                  ? const Text('Тип устройства')
                  : Text(state.jbossDevice!.name)),
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
                    ref.read(deviceEditorScreenProvider.notifier).updateSvgIcon(
                          rawSvg: await file.readAsString(),
                        );
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
                                    ref
                                        .read(
                                            deviceEditorScreenProvider.notifier)
                                        .updateSvgIcon(
                                            rawSvg: await file.readAsString());
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
