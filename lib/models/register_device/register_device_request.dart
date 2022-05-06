import 'package:json_annotation/json_annotation.dart';
part 'register_device_request.g.dart';

@JsonSerializable()
class RegisterDeviceRequest {
  @JsonKey(name: "client_id")
  final int clientId;
  @JsonKey(name: "rfid_id")
  final int rfidId;
  @JsonKey(name: "device_id")
  final int deviceId;

  RegisterDeviceRequest(
      {required this.clientId, required this.rfidId, required this.deviceId});

  factory RegisterDeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDeviceRequestToJson(this);
}
