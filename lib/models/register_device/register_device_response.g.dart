// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDeviceResponse _$RegisterDeviceResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterDeviceResponse(
      originalMesssage: json['original_message'] as String,
      resultMessage: json['result_message'] as String,
      client: json['client'] as String,
      register: json['register'] as bool,
    );

Map<String, dynamic> _$RegisterDeviceResponseToJson(
        RegisterDeviceResponse instance) =>
    <String, dynamic>{
      'original_message': instance.originalMesssage,
      'result_message': instance.resultMessage,
      'client': instance.client,
      'register': instance.register,
    };
