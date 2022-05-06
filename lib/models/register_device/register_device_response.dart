import 'package:json_annotation/json_annotation.dart';
part 'register_device_response.g.dart';

@JsonSerializable()
class RegisterDeviceResponse {
  @JsonKey(name: "original_message")
  final String originalMesssage;
  @JsonKey(name: "rfid_id")
  final String resultMessage;
  @JsonKey(name: "client")
  final String client;
  @JsonKey(name: "register")
  final bool register;

  RegisterDeviceResponse({
    required this.originalMesssage,
    required this.resultMessage,
    required this.client,
    required this.register,
  });

  factory RegisterDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDeviceResponseToJson(this);
}
