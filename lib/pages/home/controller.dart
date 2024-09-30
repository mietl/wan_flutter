import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wan_flutter/pages/webview/index.dart';

import 'package:wan_flutter/common/models/home/banner.dart';
import 'package:wan_flutter/common/models/app/article_list.dart';

import 'package:wan_flutter/common/api/home_api.dart';

import 'package:wan_flutter/common/utils/show_dialog.dart';

class HomePageController extends GetxController {
  var bannerList = <BannerInfo>[].obs;

  var articleList = <Article>[].obs;

  var currentPage = 0.obs;

  var showBackTop = false.obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onReady() {
    scrollController.addListener(handlerScroll);
    super.onReady();
  }

  @override
  void onInit() {
    requestBannerData();

    loadArticleList();

    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  handlerScroll() {
    showBackTop.value = scrollController.position.pixels > 427;

    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      showLoadingBox();
      loadArticleList().whenComplete(() {
        Get.back();
      });
    }
  }

  Future<void> loadArticleList() async {
    // 请求时展示Loading对话框
    // https://stackoverflow.com/questions/71626326/show-dialog-when-the-page-finish-init
    var response = await HomeApi.requestArticleList(currentPage.value);

    var data = response.datas ?? [];
    articleList.addAll(data);
    debugPrint('加载${response.size}条数据，当前${articleList.length}条');
    currentPage++;
  }

  void requestBannerData() {
    HomeApi.requestBanner().then((value) {
      bannerList.assignAll(value);
    });
  }

  Future<void> refreshArticleList() {
    articleList.clear();
    currentPage.value = 0;
    return loadArticleList();
  }

  openArticleLink(Article article) {
    if (article.link != null) {
      Get.to(WanWebBrowser(
          url: Uri.parse(article.link!), title: article.title ?? ''));
    }
  }

  scrollBackTop() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
