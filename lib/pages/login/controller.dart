import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wan_flutter/common/api/user_api.dart';
import 'package:wan_flutter/common/store/auth_controller.dart';
import 'package:wan_flutter/common/models/user/user_info.dart';
import 'package:wan_flutter/common/models/app/wan_response.dart';
import 'package:wan_flutter/common/utils/http_util.dart';
import 'package:wan_flutter/common/utils/shared_preferences_util.dart';
import 'package:wan_flutter/common/utils/toast.dart';
import 'package:wan_flutter/common/utils/show_dialog.dart';
import 'package:wan_flutter/pages/home/index.dart';
import 'package:wan_flutter/pages/register/index.dart';

class LoginController extends GetxController {
  TextEditingController usernameController =
      TextEditingController(text: 'mietl');

  TextEditingController passwordController =
      TextEditingController(text: 't22140127L');

  startLogin() async {
    var username = usernameController.text;
    var password = passwordController.text;

    if (username.isEmpty) {
      return toast('用户名不能为空');
    }
    if (password.isEmpty) {
      return toast('密码不能为空');
    }

    showLoadingBox(canPop: false);

    try {
      var response = await UserApi.passwordLogin(username, password);
      toast('登录成功!');
      Get.back();

      List<String>? cookies = response.headers['Set-Cookie'];
      WanHttpUtil.setCookies(cookies);

      var userInfo = ObjectResponse<UserInfo>.fromJson(
          response.data, (json) => UserInfo.fromJson(json));

      final AuthController userController = Get.find<AuthController>();
      userController.setUserInfo(userInfo.data);

      SharedPreferencesUtil().setStringList('cookies', cookies ?? []);

      // 首页
      Get.off(const HomePage());
    } catch (e) {
      if (e is WanException) {
        toast('登录失败: ${e.message}');
      } else {
        toast('登录失败: $e');
      }
      Get.back();
    }
  }

  openRegister() {
    Get.to(const RegisterPage());
  }

  @override
  onClose() {
    super.onClose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
