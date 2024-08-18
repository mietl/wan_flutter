import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class BannerInfo {
  BannerInfo({
    required this.desc,
    required this.id,
    required this.imagePath,
    required this.isVisible,
    required this.order,
    required this.title,
    required this.type,
    required this.url,
  });

  final String? desc;
  final int? id;
  final String? imagePath;
  final int? isVisible;
  final int? order;
  final String? title;
  final int? type;
  final String? url;

  factory BannerInfo.fromJson(Map<String, dynamic> json) => _$BannerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BannerInfoToJson(this);

}

/*
{
	"desc": "我们支持订阅啦~",
	"id": 30,
	"imagePath": "https://www.wanandroid.com/blogimgs/42da12d8-de56-4439-b40c-eab66c227a4b.png",
	"isVisible": 1,
	"order": 2,
	"title": "我们支持订阅啦~",
	"type": 0,
	"url": "https://www.wanandroid.com/blog/show/3352"
}*/