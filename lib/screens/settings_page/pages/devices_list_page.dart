import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/models/database/setting_type_device.dart';
import 'package:jboss_ui/provider/device_editor_setting_provider.dart';
import 'package:jboss_ui/provider/device_list_page_provider.dart';
import 'package:jboss_ui/screens/settings_page/settings_page.dart';
import 'package:jboss_ui/utils/constant.dart';

class DevicesListPage extends ConsumerWidget {
  const DevicesListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deviceListPageProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                ref.read(settingNavigationProvider.state).state =
                    SettingsScreenOption.selector;
              },
              child: const Text('Закрыть'),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ref.read(settingNavigationProvider.state).state =
                    SettingsScreenOption.addDevice;
                ref.read(deviceEditorScreenProvider.notifier).initial();
              },
              child: const Text('Добавить новое устройство'),
            )
          ],
        ),
        Expanded(
          child: ReorderableListView.builder(
            buildDefaultDragHandles: false,
            itemCount: state.devices.length,
            itemBuilder: (context, index) => Column(
              key: Key('${state.devices[index].typeDeviceId}'),
              children: [
                DeviceTileWidget(
                  typeDevice: state.devices[index],
                  index: index,
                ),
                state.devices.length == index
                    ? const SizedBox()
                    : const SizedBox(
                        height: 2.0,
                      ),
              ],
            ),
            onReorder: (int oldIndex, int newIndex) {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              ref.read(deviceListPageProvider.notifier).updateList(
                    oldIndex: oldIndex,
                    newIndex: newIndex,
                  );
            },
          ),
        ),
      ],
    );
  }
}

class DeviceTileWidget extends StatelessWidget {
  final SettingTypeDevice typeDevice;
  final int index;

  const DeviceTileWidget({
    required this.typeDevice,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kMinimumRadius,
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ReorderableDragStartListener(
                index: index,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: typeDevice.svgIcon,
                ),
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(typeDevice.typeDeviceName),
                SizedBox(
                  width: 140,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Text(typeDevice.deviceName),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 4,
            ),
            const Spacer(),
            SizedBox(
              width: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${typeDevice.price} тг.'),
                ],
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            ClipRRect(
              borderRadius: kMinimumRadius,
              child: Container(
                color: Colors.blueGrey[50],
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Редактировать',
                        style: TextStyle(
                          fontSize: 9,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Удалить'),
                    ),
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
