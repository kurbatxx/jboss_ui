import 'package:json_annotation/json_annotation.dart';
part 'search_request.g.dart';

@JsonSerializable()
class SearchRequest {
  @JsonKey(name: "search_string")
  final String searchString;
  @JsonKey(name: "school_id")
  final int schoolId;
  @JsonKey(name: "page_number")
  final int page;
  @JsonKey(name: "show_deleted")
  final bool showDeleted;

  SearchRequest({
    required this.searchString,
    required this.schoolId,
    required this.page,
    required this.showDeleted,
  });

  factory SearchRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRequestToJson(this);
}
