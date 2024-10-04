import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wan_flutter/common/models/app/article_list.dart';

import 'package:wan_flutter/common/utils/show_dialog.dart';

import 'package:wan_flutter/common/api/wx_article_api.dart';
import 'package:wan_flutter/pages/webview/index.dart';

class WxArticleListController extends GetxController {
  final String chapterId;

  WxArticleListController({required this.chapterId});

  int currentPage = 0;
  var wxArticleList = <Article>[].obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onClose() {
    scrollController.removeListener(handlerScroll);
    scrollController.dispose();

    super.onClose();
  }

  @override
  void onInit() {
    loadArticleList();

    scrollController.addListener(handlerScroll);
    super.onInit();
  }

  Future<void> refreshWxArticleList() {
    currentPage = 0;
    wxArticleList.clear();

    return loadArticleList();
  }

  loadArticleList() async {
    var articleListData =
        await WxArticleApi.getWxArticleList(chapterId, currentPage);

    wxArticleList.value = articleListData.datas ?? [];
  }

  handlerScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      showLoadingBox();
      loadArticleList().whenComplete(() {
        Get.back();
      });
    }
  }

  openArticleLink(Article article) {
    if (article.link != null) {
      Get.to(WanWebBrowser(
          url: Uri.parse(article.link!), title: article.title ?? ''));
    }
  }
}
