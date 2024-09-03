import 'package:wan_flutter/common/models/app/wan_response.dart';
import 'package:wan_flutter/common/models/wx_article/wx_article_chapter.dart';
import 'package:wan_flutter/common/utils/http_util.dart';
import 'package:wan_flutter/common/models/app/article_list.dart';

class WxArticleApi {
  static Future<List<WxArticleChapter>> getWxArticleChapters() async {
    var response = await WanHttpUtil().get('/wxarticle/chapters/json');

    var chapters = ListResponse<WxArticleChapter>.fromJson(
        response.data, (json) => WxArticleChapter.fromJson(json));

    return chapters.data;
  }

  static Future<ArticleListData> getWxArticleList(
      int chapterId, int currentPage) async {
    var response =
        await WanHttpUtil().get('/wxarticle/list/$chapterId/$currentPage/json');

    var article = ObjectResponse<ArticleListData>.fromJson(
        response.data, (json) => ArticleListData.fromJson(json));

    return article.data;
  }
}
