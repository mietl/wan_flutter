import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wan_flutter/common/api/wx_article_api.dart';
import 'package:wan_flutter/common/models/wx_article/wx_article_chapter.dart';

class WxArticlePageController extends GetxController
    with GetTickerProviderStateMixin {
  var tabChapters = <WxArticleChapter>[].obs;
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 0, vsync: this);
    getArticleChapters();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }

  getArticleChapters() async {
    var chapters = await WxArticleApi.getWxArticleChapters();

    tabChapters.value = chapters;

    tabController = TabController(length: tabChapters.length, vsync: this);
  }
}
