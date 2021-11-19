import 'dart:convert';

List<SchoolClient> schoolClientFromJson(String str) => List<SchoolClient>.from(
    json.decode(str).map((x) => SchoolClient.fromJson(x)));

String schoolClientToJson(List<SchoolClient> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchoolClient {
  SchoolClient({
    required this.id,
    required this.name,
    required this.group,
    required this.school,
    required this.balance,
  });

  final String id;
  final Name name;
  final String group;
  final String school;
  final String balance;

  factory SchoolClient.fromJson(Map<String, dynamic> json) => SchoolClient(
        id: json["id"],
        name: Name.fromJson(json["name"]),
        group: json["group"],
        school: json["school"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name.toJson(),
        "group": group,
        "school": school,
        "balance": balance,
      };
}

class Name {
  Name({
    required this.surname,
    required this.name,
    required this.patronymic,
  });

  final String surname;
  final String name;
  final String patronymic;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        surname: json["surname"],
        name: json["name"],
        patronymic: json["patronymic"],
      );

  Map<String, dynamic> toJson() => {
        "surname": surname,
        "name": name,
        "patronymic": patronymic,
      };
}
