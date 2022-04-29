import 'dart:convert';

SearchResponse searchResponseFromJson(String str) =>
    SearchResponse.fromJson(json.decode(str));
String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  SearchResponse({
    required this.clients,
    required this.allPages,
    required this.error,
  });

  final List<Client> clients;
  final int allPages;
  final String error;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        clients:
            List<Client>.from(json["clients"].map((x) => Client.fromJson(x))),
        allPages: json["all_pages"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "clients": List<dynamic>.from(clients.map((x) => x.toJson())),
        "all_pages": allPages,
        "error": error,
      };
}

class Client {
  Client({
    required this.id,
    required this.fullname,
    required this.group,
    required this.school,
    required this.balance,
  });

  final String id;
  final Fullname fullname;
  final String group;
  final String school;
  final String balance;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        fullname: Fullname.fromJson(json["fullname"]),
        group: json["group"],
        school: json["school"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname.toJson(),
        "group": group,
        "school": school,
        "balance": balance,
      };
}

class Fullname {
  Fullname({
    required this.name,
    required this.surname,
    required this.patronymic,
  });

  final String name;
  final String surname;
  final String patronymic;

  factory Fullname.fromJson(Map<String, dynamic> json) => Fullname(
        name: json["name"],
        surname: json["surname"],
        patronymic: json["patronymic"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "patronymic": patronymic,
      };
}
