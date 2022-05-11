import 'dart:math';

import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/models/register_device/register_device_request.dart';

class RegisterCardPage extends StatelessWidget {
  const RegisterCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Регистрация карт"),
      ),
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

@immutable
class RegisterState {
  final String clientId;
  final String rfidId;
  final bool loading;
  final bool register;
  final String errorMessage;
  final String successMessage;
  final int devicePosition;

  const RegisterState({
    required this.clientId,
    required this.rfidId,
    required this.loading,
    required this.register,
    required this.errorMessage,
    required this.successMessage,
    required this.devicePosition,
  });

  RegisterState copyWith({
    String? clientId,
    String? rfidId,
    bool? loading,
    bool? register,
    String? errorMessage,
    String? successMessage,
    int? devicePosition,
  }) {
    return RegisterState(
      clientId: clientId ?? this.clientId,
      rfidId: rfidId ?? this.rfidId,
      loading: loading ?? this.loading,
      register: register ?? this.register,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
      devicePosition: devicePosition ?? this.devicePosition,
    );
  }
}

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  RegisterStateNotifier(RegisterState state) : super(state);

  toogle() {
    state = state.copyWith(register: !state.register);
  }

  updateClientIdField(String text) {
    state = state.copyWith(
      clientId: text,
      successMessage: "",
      errorMessage: "",
    );
  }

  updateRfidIdField(String text) {
    state = state.copyWith(
      rfidId: text,
      successMessage: "",
      errorMessage: "",
    );
  }

  switchDevice(int position) {
    state = state.copyWith(
      devicePosition: position,
    );
  }

  void registerDevice({
    required TextEditingController clientIdController,
    required TextEditingController rfidIdController,
  }) async {
    print(clientIdController.text);

    state = state.copyWith(
      loading: true,
      errorMessage: "",
      successMessage: "",
    );

    final registerRequest = RegisterDeviceRequest(
      clientId: int.parse(state.clientId),
      rfidId: int.parse(state.rfidId),
      deviceId: devices[state.devicePosition].value,
    );

    print(registerRequest.toJson());

    await Future.delayed(const Duration(seconds: 3));

    state = state.copyWith(register: true);

    if (state.register) {
      clientIdController.clear();
      rfidIdController.clear();

      state = state.copyWith(
        clientId: clientIdController.text,
        rfidId: rfidIdController.text,
        loading: false,
        successMessage: "Зарегистрированно",
      );
    } else {
      state = state.copyWith(
        errorMessage: "Ошибка",
        loading: false,
      );
    }
  }
}

final registerStateProvider =
    StateNotifierProvider<RegisterStateNotifier, RegisterState>((ref) {
  return RegisterStateNotifier(
    const RegisterState(
      clientId: '',
      rfidId: '',
      loading: false,
      register: false,
      errorMessage: '',
      successMessage: '',
      devicePosition: 0,
    ),
  );
});

class RfidDevice {
  final int value;
  final String name;
  final IconData icon;

  RfidDevice({required this.value, required this.name, required this.icon});
}

class RegisterPage extends ConsumerWidget {
  RegisterPage({Key? key}) : super(key: key);

  final clientIdController = TextEditingController();
  final rfidIdController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerStateProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            
            controller: clientIdController,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            maxLength: 8,
            onChanged: (text) => ref
                .read(registerStateProvider.notifier)
                .updateClientIdField(text),
          ),
          TextFormField(
            controller: rfidIdController,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            onChanged: (text) => ref
                .read(registerStateProvider.notifier)
                .updateRfidIdField(text),
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedToggleSwitch<int>.size(
            current: registerState.devicePosition,
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
              print(position);
              ref.read(registerStateProvider.notifier).switchDevice(position);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          registerState.clientId.isNotEmpty && registerState.rfidId.isNotEmpty
              ? registerState.loading
                  ? const CircularProgressIndicator()
                  : TextButton(
                      onPressed: () {
                        ref.read(registerStateProvider.notifier).registerDevice(
                              clientIdController: clientIdController,
                              rfidIdController: rfidIdController,
                            );
                      },
                      child: const Text(
                        "Зарегистрировать устройство",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
              : const SizedBox(),
          registerState.errorMessage.isEmpty
              ? Text(
                  registerState.successMessage,
                  style: const TextStyle(color: Colors.green),
                )
              : Text(
                  registerState.errorMessage,
                  style: const TextStyle(color: Colors.red),
                )
        ],
      ),
    );
  }
}
