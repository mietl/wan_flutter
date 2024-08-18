// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleListData _$ArticleListDataFromJson(Map<String, dynamic> json) =>
    ArticleListData(
      curPage: (json['curPage'] as num?)?.toInt(),
      datas: (json['datas'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      offset: (json['offset'] as num?)?.toInt(),
      over: json['over'] as bool?,
      pageCount: (json['pageCount'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArticleListDataToJson(ArticleListData instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      adminAdd: json['adminAdd'] as bool?,
      apkLink: json['apkLink'] as String?,
      audit: (json['audit'] as num?)?.toInt(),
      author: json['author'] as String?,
      canEdit: json['canEdit'] as bool?,
      chapterId: (json['chapterId'] as num?)?.toInt(),
      chapterName: json['chapterName'] as String?,
      collect: json['collect'] as bool?,
      courseId: (json['courseId'] as num?)?.toInt(),
      desc: json['desc'] as String?,
      descMd: json['descMd'] as String?,
      envelopePic: json['envelopePic'] as String?,
      fresh: json['fresh'] as bool?,
      host: json['host'] as String?,
      id: (json['id'] as num?)?.toInt(),
      isAdminAdd: json['isAdminAdd'] as bool?,
      link: json['link'] as String?,
      niceDate: json['niceDate'] as String?,
      niceShareDate: json['niceShareDate'] as String?,
      origin: json['origin'] as String?,
      prefix: json['prefix'] as String?,
      projectLink: json['projectLink'] as String?,
      publishTime: (json['publishTime'] as num?)?.toInt(),
      realSuperChapterId: (json['realSuperChapterId'] as num?)?.toInt(),
      selfVisible: (json['selfVisible'] as num?)?.toInt(),
      shareDate: (json['shareDate'] as num?)?.toInt(),
      shareUser: json['shareUser'] as String?,
      superChapterId: (json['superChapterId'] as num?)?.toInt(),
      superChapterName: json['superChapterName'] as String?,
      tags: json['tags'] as List<dynamic>?,
      title: json['title'] as String?,
      type: (json['type'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      visible: (json['visible'] as num?)?.toInt(),
      zan: (json['zan'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'adminAdd': instance.adminAdd,
      'apkLink': instance.apkLink,
      'audit': instance.audit,
      'author': instance.author,
      'canEdit': instance.canEdit,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'descMd': instance.descMd,
      'envelopePic': instance.envelopePic,
      'fresh': instance.fresh,
      'host': instance.host,
      'id': instance.id,
      'isAdminAdd': instance.isAdminAdd,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'niceShareDate': instance.niceShareDate,
      'origin': instance.origin,
      'prefix': instance.prefix,
      'projectLink': instance.projectLink,
      'publishTime': instance.publishTime,
      'realSuperChapterId': instance.realSuperChapterId,
      'selfVisible': instance.selfVisible,
      'shareDate': instance.shareDate,
      'shareUser': instance.shareUser,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan,
    };
