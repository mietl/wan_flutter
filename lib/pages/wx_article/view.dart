import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controller.dart';
import 'widgets/article_list/index.dart';

class WxArticlePage extends StatefulWidget {
  const WxArticlePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WxArticlePageState();
  }
}

class _WxArticlePageState extends State<WxArticlePage>
    with AutomaticKeepAliveClientMixin {
  late final WxArticlePageController controller;

  @override
  void initState() {
    controller = Get.put(WxArticlePageController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Obx(
            () => TabBar(
                isScrollable: true,
                controller: controller.tabController,
                tabs: controller.tabChapters
                    .map(
                      (chapter) => Tab(text: chapter.name),
                    )
                    .toList()),
          ),
          Expanded(
              child: Obx(
            () => TabBarView(
                controller: controller.tabController,
                children: controller.tabChapters
                    .map((chapter) => WxArticleList(chapter))
                    .toList()),
          ))
        ],
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
