import 'package:json_annotation/json_annotation.dart';

part 'wx_article_chapter.g.dart';

@JsonSerializable()
class WxArticleChapter {
    WxArticleChapter({
        required this.articleList,
        required this.author,
        required this.children,
        required this.courseId,
        required this.cover,
        required this.desc,
        required this.id,
        required this.lisense,
        required this.lisenseLink,
        required this.name,
        required this.order,
        required this.parentChapterId,
        required this.type,
        required this.userControlSetTop,
        required this.visible,
    });

    final List<dynamic>? articleList;
    final String author;
    final List<dynamic>? children;
    final int courseId;
    final String cover;
    final String desc;
    final int id;
    final String lisense;
    final String lisenseLink;
    final String name;
    final int order;
    final int parentChapterId;
    final int type;
    final bool userControlSetTop;
    final int visible;

    factory WxArticleChapter.fromJson(Map<String, dynamic> json) => _$WxArticleChapterFromJson(json);

    Map<String, dynamic> toJson() => _$WxArticleChapterToJson(this);

}

/*
[
	{
		"articleList": [],
		"author": "",
		"children": [],
		"courseId": 13,
		"cover": "",
		"desc": "",
		"id": 408,
		"lisense": "",
		"lisenseLink": "",
		"name": "鸿洋",
		"order": 190000,
		"parentChapterId": 407,
		"type": 0,
		"userControlSetTop": false,
		"visible": 1
	}
]*/