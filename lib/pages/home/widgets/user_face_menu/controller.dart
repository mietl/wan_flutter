import 'package:get/get.dart';
import 'package:wan_flutter/common/api/user_api.dart';
import 'package:wan_flutter/common/models/user/coin.dart';

class UserFaceMenuController extends GetxController {
  var coin = Rx<Coin?>(null);

  getUserCoin() async {
    final data = await UserApi.getUserCoin();

    coin.value = data;
  }
}
