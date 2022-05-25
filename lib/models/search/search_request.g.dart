// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequest _$SearchRequestFromJson(Map<String, dynamic> json) =>
    SearchRequest(
      searchString: json['search_string'] as String,
      schoolId: json['school_id'] as int,
      page: json['page_number'] as int,
      showDeleted: json['show_deleted'] as bool,
    );

Map<String, dynamic> _$SearchRequestToJson(SearchRequest instance) =>
    <String, dynamic>{
      'search_string': instance.searchString,
      'school_id': instance.schoolId,
      'page_number': instance.page,
      'show_deleted': instance.showDeleted,
    };
