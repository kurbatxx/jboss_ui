import 'dart:convert';

SearchResponse searchResponseFromJson(String str) =>
    SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  SearchResponse({
    required this.id,
    required this.response,
    required this.schoolId,
    required this.cards,
    required this.page,
    required this.showDelete,
  });

  final int id;
  final String response;
  final int schoolId;
  final int cards;
  final int page;
  final bool showDelete;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        id: json["id"],
        response: json["response"],
        schoolId: json["school_id"],
        cards: json["cards"],
        page: json["page"],
        showDelete: json["show_delete"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "response": response,
        "school_id": schoolId,
        "cards": cards,
        "page": page,
        "show_delete": showDelete,
      };
}
