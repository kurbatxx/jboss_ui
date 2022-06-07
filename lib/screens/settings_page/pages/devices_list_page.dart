import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/models/database/setting_type_device.dart';
import 'package:jboss_ui/provider/device_list_page_provider.dart';
import 'package:jboss_ui/screens/settings_page/settings_page.dart';
import 'package:jboss_ui/utils/constant.dart';
import 'package:jboss_ui/utils/dev_log.dart';

class DevicesListPage extends ConsumerWidget {
  const DevicesListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deviceListPageProvider);
    state.devices.length.log();

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
              },
              child: const Text('Добавить новое устройство'),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: state.devices.length,
            itemBuilder: (context, index) => Column(
              children: [
                DeviceTileWidget(
                  device: state.devices[index],
                ),
                state.devices.length == index
                    ? const SizedBox()
                    : const SizedBox(
                        height: 2.0,
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DeviceTileWidget extends StatelessWidget {
  final SettingTypeDevice device;

  const DeviceTileWidget({
    required this.device,
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
            SizedBox(height: 40, width: 40, child: device.svgIcon),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(device.typeDeviceName),
                Text(device.deviceName),
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
                  Text('${device.price} тг.'),
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
