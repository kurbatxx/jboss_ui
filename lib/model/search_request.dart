import 'dart:convert';

SearchRequest searchRequestFromJson(String str) =>
    SearchRequest.fromJson(json.decode(str));

String searchRequestToJson(SearchRequest data) => json.encode(data.toJson());

class SearchRequest {
  SearchRequest({
    required this.id,
    required this.request,
    required this.schoolId,
    required this.cards,
    required this.page,
    required this.showDelete,
  });

  final int id;
  final String request;
  final int schoolId;
  final int cards;
  final int page;
  final bool showDelete;

  factory SearchRequest.fromJson(Map<String, dynamic> json) => SearchRequest(
        id: json["id"],
        request: json["request"],
        schoolId: json["school_id"],
        cards: json["cards"],
        page: json["page"],
        showDelete: json["show_delete"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "request": request,
        "school_id": schoolId,
        "cards": cards,
        "page": page,
        "show_delete": showDelete,
      };
}
