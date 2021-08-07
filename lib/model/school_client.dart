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
  final String name;
  final String group;
  final String school;
  final String balance;

  factory SchoolClient.fromJson(Map<String, dynamic> json) => SchoolClient(
        id: json["id"],
        name: json["name"],
        group: json["group"],
        school: json["school"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "group": group,
        "school": school,
        "balance": balance,
      };
}
