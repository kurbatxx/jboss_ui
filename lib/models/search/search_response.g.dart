// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      clients: (json['clients'] as List<dynamic>)
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList(),
      allPages: json['allPages'] as int,
      error: json['error'] as String,
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'clients': instance.clients.map((e) => e.toJson()).toList(),
      'allPages': instance.allPages,
      'error': instance.error,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: json['id'] as String,
      fullname: Fullname.fromJson(json['fullname'] as Map<String, dynamic>),
      group: json['group'] as String,
      school: json['school'] as String,
      balance: json['balance'] as String,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'group': instance.group,
      'school': instance.school,
      'balance': instance.balance,
    };

Fullname _$FullnameFromJson(Map<String, dynamic> json) => Fullname(
      name: json['name'] as String,
      surname: json['surname'] as String,
      patronymic: json['patronymic'] as String,
    );

Map<String, dynamic> _$FullnameToJson(Fullname instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'patronymic': instance.patronymic,
    };
