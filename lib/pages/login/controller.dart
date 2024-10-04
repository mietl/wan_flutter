import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wan_flutter/common/api/user_api.dart';
import 'package:wan_flutter/common/global/auth.dart';
import 'package:wan_flutter/common/models/user/user_info.dart';
import 'package:wan_flutter/common/models/app/wan_response.dart';
import 'package:wan_flutter/common/utils/http_util.dart';
import 'package:wan_flutter/common/utils/shared_preferences_util.dart';
import 'package:wan_flutter/common/utils/toast.dart';
import 'package:wan_flutter/common/utils/show_dialog.dart';
import 'package:wan_flutter/pages/main/index.dart';
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
      // 关闭 loading
      Get.back();

      List<String>? cookies = response.headers['Set-Cookie'];
      WanHttpUtil.setHeadersCookies(cookies);

      var userInfo = ObjectResponse<UserInfo?>.fromJson(
          response.data, (json) => UserInfo.fromJson(json));

      final AuthController userController = Get.find<AuthController>();
      userController.setUserInfo(userInfo.data);

      SharedPreferencesUtil().setStringList('cookies', cookies ?? []);

      // 首页
      Get.off(() => const MainPageView());
    } catch (e) {
      if (e is WanException) {
        toast('登录失败: ${e.message}');
      } else {
        toast('登录失败: $e');
      }
      Get.back();
    }
  }

  openRegister() async {
    var value = await Get.to(const RegisterPage());
    // 注册成功后，同时关闭登录页
    if (value) {
      Get.back();
    }
  }

  @override
  onClose() {
    super.onClose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
