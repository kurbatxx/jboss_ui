import 'dart:convert';

AuthorizationToken authorizationTokenFromJson(String str) => AuthorizationToken.fromJson(json.decode(str));
String authorizationTokenToJson(AuthorizationToken data) => json.encode(data.toJson());

class AuthorizationToken {
  AuthorizationToken({
    required this.cookie,
    required this.error,
  });

  final String cookie;
  final String error;

  factory AuthorizationToken.fromJson(Map<String, dynamic> json) => AuthorizationToken(
    cookie: json["cookie"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "cookie": cookie,
    "error": error,
  };

  @override
  String toString() {
    return 'AuthorizationToken: {cookie: $cookie,\n error: $error}';
  }
}