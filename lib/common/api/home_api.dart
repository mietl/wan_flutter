import 'package:wan_flutter/common/models/home/article_list.dart';
import 'package:wan_flutter/common/models/home/banner.dart';
import 'package:wan_flutter/common/models/wan_response.dart';
import 'package:wan_flutter/common/utils/api_constant.dart';
import 'package:wan_flutter/common/utils/http_util.dart';

class HomeApi {
  static Future<List<BannerInfo>> requestBanner() async {
    var response = await WanHttpUtil().get(ApiConstant.banner);

    var banner = ListResponse<BannerInfo>.fromJson(response.data,(json)=>BannerInfo.fromJson(json));

    return banner.data ?? [];
  }

  static Future<ArticleListData> requestArticleList(int pageNumber) async {
    var response = await WanHttpUtil().get('/article/list/$pageNumber/json');

    var article = ObjectResponse<ArticleListData>.fromJson(response.data,(json)=>ArticleListData.fromJson(json));

    return article.data!;
  }
}