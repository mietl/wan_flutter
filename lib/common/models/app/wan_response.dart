import 'package:json_annotation/json_annotation.dart';
part 'wan_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ObjectResponse<T> {
  final T data;
  final int errorCode;
  final String errorMsg;

  ObjectResponse(
      {required this.data, required this.errorCode, required this.errorMsg});

  factory ObjectResponse.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$ObjectResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(dynamic Function(T value) toJsonT) =>
      _$ObjectResponseToJson(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class ListResponse<T> {
  final List<T> data;
  final int errorCode;
  final String errorMsg;

  ListResponse(
      {required this.data, required this.errorCode, required this.errorMsg});

  factory ListResponse.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$ListResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(dynamic Function(T value) toJsonT) =>
      _$ListResponseToJson(this, toJsonT);
}
