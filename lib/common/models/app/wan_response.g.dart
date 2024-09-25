// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectResponse<T> _$ObjectResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ObjectResponse<T>(
      data: fromJsonT(json['data']),
      errorCode: (json['errorCode'] as num).toInt(),
      errorMsg: json['errorMsg'] as String,
    );

Map<String, dynamic> _$ObjectResponseToJson<T>(
  ObjectResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

ListResponse<T> _$ListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ListResponse<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      errorCode: (json['errorCode'] as num).toInt(),
      errorMsg: json['errorMsg'] as String,
    );

Map<String, dynamic> _$ListResponseToJson<T>(
  ListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
