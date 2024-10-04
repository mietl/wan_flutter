import 'package:get/get.dart';
import 'package:wan_flutter/common/api/user_api.dart';
import 'package:wan_flutter/common/models/user/coin.dart';

import 'package:wan_flutter/pages/login/index.dart';
import 'package:wan_flutter/pages/settings/index.dart';

class UserFaceMenuController extends GetxController {
  var coin = Rx<Coin?>(null);

  getUserCoin() async {
    final data = await UserApi.getUserCoin();

    coin.value = data;
  }

  @override
  onReady() {
    super.onReady();

    getUserCoin();
  }

  openSettings() {
    Get.to(const SettingsPage());
  }

  toLogin() {
    Get.to(const LoginPage());
  }
}
