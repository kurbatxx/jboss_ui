import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/provider/register_device_screen_provider.dart';
import 'package:jboss_ui/utils/dev_log.dart';

class RegisterDeviceScreen extends StatelessWidget {
  const RegisterDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterPage(),
    );
  }
}

final devices = [
  RfidDevice(
    value: 1,
    name: "Карта",
    icon: Icons.credit_card,
  ),
  RfidDevice(
    value: 9,
    name: "Браслет",
    icon: Icons.watch_rounded,
  ),
  RfidDevice(
    value: 11,
    name: "Брелок",
    icon: Icons.vpn_key_rounded,
  ),
];

enum TextControllersEnum {
  clientId,
  rfidId,
}

class RfidDevice {
  final int value;
  final String name;
  final IconData icon;

  RfidDevice({required this.value, required this.name, required this.icon});
}

class RegisterPage extends ConsumerWidget {
  RegisterPage({Key? key}) : super(key: key);

  // final clientIdController = TextEditingController();
  // final rfidIdController = TextEditingController();

  final clientIdNode = FocusNode();
  final rfidIdNode = FocusNode();
  final registerButtonNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerDeviceScreenStateProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            controller: state.clientIdController,
            autofocus: true,
            focusNode: clientIdNode,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(8),
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            decoration: const InputDecoration(hintText: "ID Клиента"),
            onChanged: (_) =>
                ref.read(registerDeviceScreenStateProvider.notifier).updateText(
                      controller: state.clientIdController,
                      textControllersEnum: TextControllersEnum.clientId,
                    ),
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(rfidIdNode);
            },
          ),
          TextFormField(
            controller: state.rfidIdController,
            focusNode: rfidIdNode,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            decoration: const InputDecoration(hintText: "ID устройства"),
            onChanged: (value) =>
                ref.read(registerDeviceScreenStateProvider.notifier).updateText(
                      controller: state.rfidIdController,
                      textControllersEnum: TextControllersEnum.rfidId,
                    ),
            onFieldSubmitted: (_) {
              if (state.rfidIdController.text.trim().isNotEmpty) {
                FocusScope.of(context).requestFocus(registerButtonNode);
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedToggleSwitch<int>.size(
            current: state.devicePosition,
            values: Iterable<int>.generate(devices.length).toList(),
            iconOpacity: 0.2,
            indicatorSize: const Size.fromWidth(100),
            iconAnimationType: AnimationType.onHover,
            indicatorAnimationType: AnimationType.onHover,
            animationDuration: const Duration(milliseconds: 250),
            borderWidth: 0.0,
            borderColor: Colors.transparent,
            iconBuilder: (position, size) {
              return Icon(
                devices[position].icon,
                size: min(size.width, size.height),
              );
            },
            onChanged: (position) {
              position.log();
              ref
                  .read(registerDeviceScreenStateProvider.notifier)
                  .switchDevice(position);
            },
          ),
          const SizedBox(
            height: 40,
          ),
          state.clientIdController.text.trim().isNotEmpty &&
                  state.rfidIdController.text.trim().isNotEmpty
              ? state.loading
                  ? const CircularProgressIndicator()
                  : TextButton(
                      focusNode: registerButtonNode,
                      onPressed: () {
                        ref
                            .read(registerDeviceScreenStateProvider.notifier)
                            .registerDevice(
                              clientIdController: state.clientIdController,
                              rfidIdController: state.rfidIdController,
                              clientIdNode: clientIdNode,
                              context: context,
                            );
                      },
                      child: const Text(
                        "Зарегистрировать устройство",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
              : const SizedBox(),
          state.errorMessage.isEmpty
              ? Column(
                  children: [
                    Text(
                      state.successMessage,
                      style: const TextStyle(color: Colors.green),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      state.clientMessage,
                      style: TextStyle(
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                )
              : Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                )
        ],
      ),
    );
  }
}
