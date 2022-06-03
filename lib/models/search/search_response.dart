import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchResponse {
  final List<Client> clients;
  @JsonKey(name: "max_page")
  final int maxPage;
  final String error;

  SearchResponse({
    required this.clients,
    required this.maxPage,
    required this.error,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable()
class Client {
  final String id;
  @JsonKey(name: "full_name")
  final FullName fullName;
  final String group;
  final String school;
  final String balance;

  const Client({
    required this.id,
    required this.fullName,
    required this.group,
    required this.school,
    required this.balance,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

@JsonSerializable()
class FullName {
  final String name;
  final String surname;
  final String patronymic;

  const FullName({
    required this.name,
    required this.surname,
    required this.patronymic,
  });

  factory FullName.fromJson(Map<String, dynamic> json) =>
      _$FullNameFromJson(json);

  Map<String, dynamic> toJson() => _$FullNameToJson(this);
}
