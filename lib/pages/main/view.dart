import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/utils/show_dialog.dart';
import 'package:wan_flutter/pages/home/index.dart';
import 'package:wan_flutter/pages/wx_article/index.dart';

import 'controller.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainPageController());

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await showBackDialog(context) ?? false;
        if (shouldPop) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: PageView(
          controller: controller.pageController,
          onPageChanged: controller.onPageChanged,
          children: const [
            HomePage(),
            WxArticlePage(),
            Center(child: Text('收藏')),
            Center(child: Text('我的')),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 5,
                offset: const Offset(0, 2), // 向下偏移 2 个像素
              ),
            ],
          ),
          child: Obx(
            () => NavigationBar(
                indicatorColor: const Color(0xFFcfc2ca),
                backgroundColor: Colors.white,
                onDestinationSelected: controller.onDestinationSelected,
                selectedIndex: controller.selectedIndex.value,
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.cottage_outlined),
                      label: '首页',
                      selectedIcon: Icon(
                        Icons.cottage,
                      )),
                  NavigationDestination(
                      icon: Icon(Icons.sticky_note_2_outlined),
                      label: '文章',
                      selectedIcon: Icon(Icons.sticky_note_2)),
                  NavigationDestination(
                      icon: Icon(Icons.star_border_outlined),
                      label: '收藏',
                      selectedIcon: Icon(Icons.star)),
                  NavigationDestination(
                      icon: Icon(Icons.info_outline),
                      label: '我的',
                      selectedIcon: Icon(Icons.info_sharp)),
                ]),
          ),
        ),
      ),
    );
  }
}
