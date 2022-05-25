// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequest _$SearchRequestFromJson(Map<String, dynamic> json) =>
    SearchRequest(
      searchString: json['search_string'] as String,
      schoolId: json['school_id'] as int,
      page: json['page'] as int,
      showDelete: json['show_delete'] as bool,
    );

Map<String, dynamic> _$SearchRequestToJson(SearchRequest instance) =>
    <String, dynamic>{
      'search_string': instance.searchString,
      'school_id': instance.schoolId,
      'page': instance.page,
      'show_delete': instance.showDelete,
    };
