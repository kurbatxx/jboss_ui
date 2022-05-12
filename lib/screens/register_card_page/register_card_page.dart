import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/jboss.dart';
import 'package:jboss_ui/models/register_device/register_device_request.dart';
import 'package:jboss_ui/models/register_device/register_device_response.dart';
import 'package:jboss_ui/utils/dev_log.dart';

class RegisterCardPage extends StatelessWidget {
  const RegisterCardPage({Key? key}) : super(key: key);

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

@immutable
class RegisterState {
  final String clientId;
  final String rfidId;
  final bool loading;
  final bool register;
  final String errorMessage;
  final String successMessage;
  final String clientMessage;
  final int devicePosition;

  const RegisterState({
    required this.clientId,
    required this.rfidId,
    required this.loading,
    required this.register,
    required this.errorMessage,
    required this.successMessage,
    required this.clientMessage,
    required this.devicePosition,
  });

  RegisterState copyWith({
    String? clientId,
    String? rfidId,
    bool? loading,
    bool? register,
    String? errorMessage,
    String? successMessage,
    String? clientMessage,
    int? devicePosition,
  }) {
    return RegisterState(
      clientId: clientId ?? this.clientId,
      rfidId: rfidId ?? this.rfidId,
      loading: loading ?? this.loading,
      register: register ?? this.register,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
      clientMessage: clientMessage ?? this.clientMessage,
      devicePosition: devicePosition ?? this.devicePosition,
    );
  }
}

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  RegisterStateNotifier(RegisterState state) : super(state);

  clearState() {
    state = state.copyWith(
      clientId: "",
      successMessage: "",
      errorMessage: "",
      devicePosition: 0,
      register: false,
    );
  }

  toogle() {
    state = state.copyWith(register: !state.register);
  }

  updateTextField(
      {required TextEditingController textController,
      required TextControllersEnum textControllersEnum}) {
    switch (textControllersEnum) {
      case TextControllersEnum.clientId:
        state = state.copyWith(
          clientId: textController.text,
        );
        break;
      case TextControllersEnum.rfidId:
        state = state.copyWith(
          rfidId: textController.text,
        );
        break;
    }
    state = state.copyWith(
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
    required FocusNode clientIdNode,
    required BuildContext context,
  }) async {
    clientIdController.text.log();

    state = state.copyWith(
      loading: true,
      errorMessage: "",
      successMessage: "",
    );

    final registerDeviceRequest = RegisterDeviceRequest(
      clientId: int.parse(state.clientId),
      rfidId: int.parse(state.rfidId),
      deviceId: devices[state.devicePosition].value,
    );

    registerDeviceRequest.toJson().log();

    final registerDeviceResponseString =
        await compute(JbossApi.computeRegisterDevice, registerDeviceRequest);
    Map<String, dynamic> registerDeviceResponseMap =
        jsonDecode(registerDeviceResponseString);
    RegisterDeviceResponse registerDeviceResponse =
        RegisterDeviceResponse.fromJson(registerDeviceResponseMap);

    //await Future.delayed(const Duration(seconds: 3));

    state = state.copyWith(register: registerDeviceResponse.register);

    if (state.register) {
      clientIdController.clear();
      rfidIdController.clear();

      state = state.copyWith(
        clientId: clientIdController.text,
        rfidId: rfidIdController.text,
        loading: false,
        successMessage: registerDeviceResponse.resultMessage,
        clientMessage: registerDeviceResponse.client,
      );
      if (!mounted) return;
      FocusScope.of(context).requestFocus(clientIdNode);
    } else {
      state = state.copyWith(
        errorMessage: registerDeviceResponse.resultMessage,
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
      clientMessage: '',
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

  final clientIdNode = FocusNode();
  final rfidIdNode = FocusNode();
  final registerButtonNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerStateProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    ref.read(registerStateProvider.notifier).clearState();
                    Navigator.pop(context);
                  },
                  child: const Text("Закончить регистрацию устройств"))
            ],
          ),
          TextFormField(
            controller: clientIdController,
            autofocus: true,
            focusNode: clientIdNode,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            maxLength: 8,
            decoration: const InputDecoration(hintText: "ID Клиента"),
            onChanged: (_) =>
                ref.read(registerStateProvider.notifier).updateTextField(
                      textController: clientIdController,
                      textControllersEnum: TextControllersEnum.clientId,
                    ),
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(rfidIdNode);
            },
          ),
          TextFormField(
            controller: rfidIdController,
            focusNode: rfidIdNode,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            maxLength: 10,
            decoration: const InputDecoration(hintText: "ID устройства"),
            onChanged: (_) =>
                ref.read(registerStateProvider.notifier).updateTextField(
                      textController: rfidIdController,
                      textControllersEnum: TextControllersEnum.rfidId,
                    ),
            onFieldSubmitted: (_) {
              if (registerState.rfidId.isNotEmpty) {
                FocusScope.of(context).requestFocus(registerButtonNode);
              }
            },
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
              position.log();
              ref.read(registerStateProvider.notifier).switchDevice(position);
            },
          ),
          const SizedBox(
            height: 40,
          ),
          registerState.clientId.isNotEmpty && registerState.rfidId.isNotEmpty
              ? registerState.loading
                  ? const CircularProgressIndicator()
                  : TextButton(
                      focusNode: registerButtonNode,
                      onPressed: () {
                        ref.read(registerStateProvider.notifier).registerDevice(
                              clientIdController: clientIdController,
                              rfidIdController: rfidIdController,
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
          registerState.errorMessage.isEmpty
              ? Column(
                  children: [
                    Text(
                      registerState.successMessage,
                      style: const TextStyle(color: Colors.green),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      registerState.clientMessage,
                      style: TextStyle(
                        color: Colors.green[700],
                      ),
                    ),
                  ],
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
