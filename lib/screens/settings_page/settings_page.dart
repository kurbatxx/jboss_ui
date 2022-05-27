import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/screens/settings_page/pages/add_devices_settings_page.dart';
import 'package:jboss_ui/screens/settings_page/pages/devices_list_widget.dart';
import 'package:jboss_ui/utils/constant.dart';

final settingNavigationProvider =
    StateProvider((ref) => SettingsScreenOption.selector);

enum SettingsScreenOption {
  selector(
    screen: SettingSelectorWidget(),
  ),
  devices(
    screen: DevicesListWidget(),
  ),
  server(screen: Center()),
  notify(screen: Center()),
  addDevice(
    screen: DevicesAddWidget(),
  );

  final Widget screen;
  const SettingsScreenOption({
    required this.screen,
  });
}

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingNavigation = ref.watch(settingNavigationProvider);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: kMinimumRadius,
        child: Container(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: settingNavigation.screen,
          ),
        ),
      ),
    );
  }
}

class SettingSelectorWidget extends ConsumerWidget {
  const SettingSelectorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(),
        SizedBox(
          width: 260,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(settingNavigationProvider.state).state =
                      SettingsScreenOption.devices;
                },
                child: const Text('Устройства'),
              ),
              const SizedBox(
                height: 2.0,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Подключение к серверу'),
              ),
              const SizedBox(
                height: 2.0,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Уведомления'),
              )
            ],
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}
