// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gen_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenReq<T> _$GenReqFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    GenReq<T>(
      data: fromJsonT(json['data']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenReqToJson<T>(
  GenReq<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'name': instance.name,
    };
