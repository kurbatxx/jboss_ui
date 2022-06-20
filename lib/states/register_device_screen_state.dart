import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_device_screen_state.freezed.dart';

@freezed
class RegisterDeviceState with _$RegisterDeviceState {
  const factory RegisterDeviceState({
    required TextEditingController clientIdController,
    required TextEditingController rfidIdController,
    required bool loading,
    required bool register,
    required String errorMessage,
    required String successMessage,
    required String clientMessage,
    required int devicePosition,
  }) = _RegisterDeviceState;
}
