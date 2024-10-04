import 'package:get/get.dart';
import 'package:wan_flutter/common/models/user/user_info.dart';

class AuthController extends GetxController {
  var userInfo = Rx<UserInfo?>(null);

  setUserInfo(UserInfo? value) {
    userInfo.value = value;
  }
}
