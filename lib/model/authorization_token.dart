import 'package:meta/meta.dart';
import 'dart:convert';

AuthorizationToken authorizationTokenFromJson(String str) => AuthorizationToken.fromJson(json.decode(str));
String authorizationTokenToJson(AuthorizationToken data) => json.encode(data.toJson());

class AuthorizationToken {
  AuthorizationToken({
    required this.token,
    required this.error,
  });

  final String token;
  final String error;

  factory AuthorizationToken.fromJson(Map<String, dynamic> json) => AuthorizationToken(
    token: json["token"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "error": error,
  };
}