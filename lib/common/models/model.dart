import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(explicitToJson: true)
class Response {
 final List<Banner>? data;
 final int? errorCode;
 final String? errorMsg;

 Response(this.data,this.errorCode,this.errorMsg);

 factory Response.fromJson(Map<String,dynamic> json) => _$ResponseFromJson(json);

 Map<String,dynamic> toJson()=>_$ResponseToJson(this);
}

@JsonSerializable()
class Banner{
  @JsonKey(name:'id')
  final int bid;
  final String desc;
  final String imagePath;
  final int isVisible;
  final String title;
  final String url;

  Banner(this.bid,this.desc,this.imagePath,this.isVisible,this.title,this.url);

  factory Banner.fromJson(Map<String,dynamic> json)=> _$BannerFromJson(json);

  Map<String,dynamic> toJson() => _$BannerToJson(this);
}
