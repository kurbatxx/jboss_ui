import 'package:json_annotation/json_annotation.dart';

part 'gen_req.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GenReq<T> {
  T data;
  GenReq({required this.data});

  factory GenReq.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$GenReqFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$GenReqToJson<T>(this, toJsonT);
}
