import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/global/auth.dart';

import 'controller.dart';

class UserFaceMenu extends StatelessWidget {
  const UserFaceMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final controller = Get.put(UserFaceMenuController());

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFEADFD7),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(authController.userInfo.value?.nickname ?? '--',
                          style: const TextStyle(
                            fontSize: 24,
                          )),
                      const Icon(Icons.male, color: Color(0xFF619AC3), size: 29)
                    ],
                  ),
                  const Text('现实也许没有那么天真，但我想要做什么事，虽然不知道答案，但是只要有所行动，就一定会有所改变。',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14))
                ],
              )),
          ListTile(
            leading: const Icon(Icons.credit_score),
            onTap: controller.getUserCoin,
            title: Text("当前积分(${controller.coin.value?.coinCount ?? 0} )"),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('设置'),
            onTap: controller.openSettings,
          ),
          ListTile(
              leading: const Icon(Icons.logout),
              title: Obx(() =>
                  Text(authController.userInfo.value != null ? '退出登陆' : '登录')),
              onTap: controller.toLogin)
        ],
      ),
    );
  }
}
