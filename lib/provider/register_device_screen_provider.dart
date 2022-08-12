import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/api/ffi_api.dart';
import 'package:jboss_ui/models/generic/gen_req.dart';
import 'package:jboss_ui/states/register_device_screen_state.dart';
import 'package:jboss_ui/models/register_device/register_device_request.dart';
import 'package:jboss_ui/models/register_device/register_device_response.dart';
import 'package:jboss_ui/screens/register_device_screen/register_device_screen.dart';

import 'package:jboss_ui/utils/dev_log.dart';

final registerDeviceScreenStateProvider = StateNotifierProvider<
    RegisterDeviceScreenStateNotifier, RegisterDeviceState>(
  (ref) => RegisterDeviceScreenStateNotifier(
    RegisterDeviceState(
      clientIdController: TextEditingController(),
      rfidIdController: TextEditingController(),
      loading: false,
      register: false,
      errorMessage: '',
      successMessage: '',
      clientMessage: '',
      devicePosition: 0,
    ),
  ),
);

class RegisterDeviceScreenStateNotifier
    extends StateNotifier<RegisterDeviceState> {
  RegisterDeviceScreenStateNotifier(RegisterDeviceState state) : super(state);

  clearState() {
    state = state.copyWith(
      clientIdController: TextEditingController(),
      rfidIdController: TextEditingController(),
      successMessage: "",
      errorMessage: "",
      clientMessage: "",
      devicePosition: 0,
      register: false,
    );
  }

  void toogle() {
    state = state.copyWith(register: !state.register);
  }

  void updateText({
    required TextEditingController controller,
    required TextControllersEnum textControllersEnum,
  }) {
    switch (textControllersEnum) {
      case TextControllersEnum.clientId:
        state = state.copyWith(
          clientIdController: controller,
        );
        break;
      case TextControllersEnum.rfidId:
        state = state.copyWith(
          rfidIdController: controller,
        );
        break;
    }
    state = state.copyWith(
      successMessage: "",
      errorMessage: "",
      clientMessage: "",
    );
  }

  void switchDevice(int position) {
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
    state = state.copyWith(
      loading: true,
      errorMessage: "",
      successMessage: "",
    );

    final registerDeviceRequest = RegisterDeviceRequest(
      clientId: int.parse(state.clientIdController.text),
      rfidId: int.parse(state.rfidIdController.text),
      deviceId: devices[state.devicePosition].value,
    );

    registerDeviceRequest.toJson().log();

    final registerDeviceResponse = RegisterDeviceResponse.fromJson(
      await FFIApi.getResp(
        GenReq(
          data: registerDeviceRequest,
          name: "register_device",
        ),
      ),
    );

    state = state.copyWith(register: registerDeviceResponse.register);

    if (state.register) {
      clientIdController.clear();
      rfidIdController.clear();

      state = state.copyWith(
        clientIdController: clientIdController,
        rfidIdController: rfidIdController,
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
