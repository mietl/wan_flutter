
import 'package:json_annotation/json_annotation.dart';

part 'generic_model.g.dart';

@JsonSerializable(genericArgumentFactories:true)
class Response<T> {
  final T? data;
  final int? errorCode;
  final String? errorMsg;

  Response({this.data,this.errorCode,this.errorMsg});

  factory Response.fromJson(Map<String,dynamic> json,T Function(dynamic json) callbackT) => _$ResponseFromJson(json,callbackT);

  Map<String,dynamic> toJson(dynamic Function(T value) callbackT)=>_$ResponseToJson(this,callbackT);
}


@JsonSerializable(genericArgumentFactories:true)

class ListResponse<T>{
  final List<T> data;
  final int errorCode;
  final String errorMsg;

  ListResponse({required this.data,required this.errorCode,required this.errorMsg});


  factory ListResponse.fromJson(Map<String,dynamic> json,T Function(dynamic json) callbackT)=>_$ListResponseFromJson(json,callbackT);

  Map<String,dynamic> toJson(dynamic Function(T value) callbackT) => _$ListResponseToJson(this,callbackT);
}
