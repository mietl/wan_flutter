import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wan_flutter/common/widget/article_tile.dart';
import 'package:wan_flutter/common/widget/carousel_image.dart';
import 'package:wan_flutter/pages/home/widgets/user_face_menu/index.dart';

import './controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  late HomePageController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(HomePageController());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f7),
      appBar: AppBar(
          surfaceTintColor: const Color(0xFFFFFFFF), // why ?
          backgroundColor: const Color(0xFFFFFFFF),
          title: const Text('首页'),
          elevation: 1,
          shadowColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(7),
        // solution1 https://segmentfault.com/a/1190000044394688
        // solution2 https://juejin.cn/post/7184955986224873531
        child: RefreshIndicator(
          onRefresh: controller.refreshArticleList,
          child: SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() => CarouselImage(
                    images: controller.bannerList
                        .map((img) => img.imagePath ?? '')
                        .toList(),
                    height: 214)),
                Obx(
                  () => ListView.builder(
                      // https://blog.csdn.net/ZuoYueLiang/article/details/131787672
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ArticleTile(controller.articleList[index],
                            onTap: controller.openArticleLink);
                      },
                      itemCount: controller.articleList.length),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: const UserFaceMenu(),
      floatingActionButton: Obx(
        () => Visibility(
          visible: controller.showBackTop.value,
          child: FloatingActionButton(
              onPressed: controller.scrollBackTop,
              child: const Icon(Icons.keyboard_arrow_up_rounded)),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
