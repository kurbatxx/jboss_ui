// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDeviceRequest _$RegisterDeviceRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterDeviceRequest(
      clientId: json['client_id'] as int,
      rfidId: json['rfid_id'] as int,
      deviceId: json['device_id'] as int,
    );

Map<String, dynamic> _$RegisterDeviceRequestToJson(
        RegisterDeviceRequest instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'rfid_id': instance.rfidId,
      'device_id': instance.deviceId,
    };
