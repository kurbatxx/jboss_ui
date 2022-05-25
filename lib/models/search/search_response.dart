import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchResponse {
  final List<Client> clients;
  final int allPages;
  final String error;

  SearchResponse({
    required this.clients,
    required this.allPages,
    required this.error,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable()
class Client {
  final String id;
  final Fullname fullname;
  final String group;
  final String school;
  final String balance;

  Client({
    required this.id,
    required this.fullname,
    required this.group,
    required this.school,
    required this.balance,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

@JsonSerializable()
class Fullname {
  final String name;
  final String surname;
  final String patronymic;

  Fullname({
    required this.name,
    required this.surname,
    required this.patronymic,
  });

  factory Fullname.fromJson(Map<String, dynamic> json) =>
      _$FullnameFromJson(json);

  Map<String, dynamic> toJson() => _$FullnameToJson(this);
}
