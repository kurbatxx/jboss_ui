import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/screens/settings_page/settings_page.dart';
import 'package:jboss_ui/utils/constant.dart';

class DevicesListWidget extends ConsumerWidget {
  const DevicesListWidget({Key? key}) : super(key: key);

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
          child: ListView(
            children: const [DeviceTileWidget()],
          ),
        ),
      ],
    );
  }
}

class DeviceTileWidget extends StatelessWidget {
  const DeviceTileWidget({
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
            const SizedBox(
                height: 50, width: 50, child: Icon(Icons.collections_rounded)),
            SizedBox(
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Название устройства'),
                ],
              ),
            ),
            SizedBox(
              width: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('10000 тг.'),
                ],
              ),
            ),
            SizedBox(
              width: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('10'),
                ],
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Spacer(),
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
