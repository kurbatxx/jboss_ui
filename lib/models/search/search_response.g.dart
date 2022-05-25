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
      maxPage: json['max_page'] as int,
      error: json['error'] as String,
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'clients': instance.clients.map((e) => e.toJson()).toList(),
      'max_page': instance.maxPage,
      'error': instance.error,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: json['id'] as String,
      fullName: FullName.fromJson(json['full_name'] as Map<String, dynamic>),
      group: json['group'] as String,
      school: json['school'] as String,
      balance: json['balance'] as String,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'group': instance.group,
      'school': instance.school,
      'balance': instance.balance,
    };

FullName _$FullNameFromJson(Map<String, dynamic> json) => FullName(
      name: json['name'] as String,
      surname: json['surname'] as String,
      patronymic: json['patronymic'] as String,
    );

Map<String, dynamic> _$FullNameToJson(FullName instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'patronymic': instance.patronymic,
    };
