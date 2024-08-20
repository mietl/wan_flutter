import 'package:json_annotation/json_annotation.dart';

part 'article_list.g.dart';

@JsonSerializable()
class ArticleListData {
  ArticleListData({
    required this.curPage,
    required this.datas,
    required this.offset,
    required this.over,
    required this.pageCount,
    required this.size,
    required this.total,
  });

  final int? curPage;
  final List<Article>? datas;
  final int? offset;
  final bool? over;
  final int? pageCount;
  final int? size;
  final int? total;

  factory ArticleListData.fromJson(Map<String, dynamic> json) => _$ArticleListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleListDataToJson(this);

}

@JsonSerializable()
class Article {
  Article({
    required this.adminAdd,
    required this.apkLink,
    required this.audit,
    required this.author,
    required this.canEdit,
    required this.chapterId,
    required this.chapterName,
    required this.collect,
    required this.courseId,
    required this.desc,
    required this.descMd,
    required this.envelopePic,
    required this.fresh,
    required this.host,
    required this.id,
    required this.isAdminAdd,
    required this.link,
    required this.niceDate,
    required this.niceShareDate,
    required this.origin,
    required this.prefix,
    required this.projectLink,
    required this.publishTime,
    required this.realSuperChapterId,
    required this.selfVisible,
    required this.shareDate,
    required this.shareUser,
    required this.superChapterId,
    required this.superChapterName,
    required this.tags,
    required this.title,
    required this.type,
    required this.userId,
    required this.visible,
    required this.zan,
  });

  final bool? adminAdd;
  final String? apkLink;
  final int? audit;
  final String? author;
  final bool? canEdit;
  final int? chapterId;
  final String? chapterName;
  final bool? collect;
  final int? courseId;
  final String? desc;
  final String? descMd;
  final String? envelopePic;
  final bool? fresh;
  final String? host;
  final int? id;
  final bool? isAdminAdd;
  final String? link;
  final String? niceDate;
  final String? niceShareDate;
  final String? origin;
  final String? prefix;
  final String? projectLink;
  final int? publishTime;
  final int? realSuperChapterId;
  final int? selfVisible;
  final int? shareDate;
  final String? shareUser;
  final int? superChapterId;
  final String? superChapterName;
  final List<dynamic>? tags;
  final String? title;
  final int? type;
  final int? userId;
  final int? visible;
  final int? zan;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

}

/*
{
	"curPage": 2,
	"datas": [
		{
			"adminAdd": false,
			"apkLink": "",
			"audit": 1,
			"author": "",
			"canEdit": false,
			"chapterId": 502,
			"chapterName": "自助",
			"collect": false,
			"courseId": 13,
			"desc": "",
			"descMd": "",
			"envelopePic": "",
			"fresh": false,
			"host": "",
			"id": 28770,
			"isAdminAdd": false,
			"link": "https://juejin.cn/post/7396254541916078132",
			"niceDate": "2024-08-04 22:11",
			"niceShareDate": "2024-08-04 22:09",
			"origin": "",
			"prefix": "",
			"projectLink": "",
			"publishTime": 1722780695000,
			"realSuperChapterId": 493,
			"selfVisible": 0,
			"shareDate": 1722780586000,
			"shareUser": "鸿洋",
			"superChapterId": 494,
			"superChapterName": "广场Tab",
			"tags": [],
			"title": "【Gradle-19】Android多渠道打包指南",
			"type": 0,
			"userId": 2,
			"visible": 1,
			"zan": 0
		}
	],
	"offset": 20,
	"over": false,
	"pageCount": 781,
	"size": 20,
	"total": 15609
}*/