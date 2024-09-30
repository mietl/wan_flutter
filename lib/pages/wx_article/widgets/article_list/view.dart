import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/models/wx_article/wx_article_chapter.dart';
import 'package:wan_flutter/common/widget/article_tile.dart';

import 'controller.dart';

class WxArticleList extends StatefulWidget {
  final WxArticleChapter chapter;

  const WxArticleList(this.chapter, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _WxArticleListState();
  }
}

class _WxArticleListState extends State<WxArticleList>
    with AutomaticKeepAliveClientMixin {
  late final WxArticleListController controller;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: RefreshIndicator(
        onRefresh: controller.refreshWxArticleList,
        child: Obx(
          () => ListView.builder(
              controller: controller.scrollController,
              itemBuilder: (context, index) {
                return ArticleTile(controller.wxArticleList[index],
                    onTap: controller.openArticleLink);
              },
              itemCount: controller.wxArticleList.length),
        ),
      ),
    );
  }

  @override
  initState() {
    super.initState();

    var chapterId = widget.chapter.id.toString();
    controller =
        Get.put(WxArticleListController(chapterId: chapterId), tag: chapterId);
  }

  @override
  bool get wantKeepAlive => true;
}
