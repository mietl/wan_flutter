import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/api/user_api.dart';
import 'package:wan_flutter/common/models/app/wan_response.dart';
import 'package:wan_flutter/common/models/user/user_info.dart';
import 'package:wan_flutter/common/utils/http_util.dart';
import 'package:wan_flutter/common/utils/shared_preferences_util.dart';
import 'package:wan_flutter/common/utils/show_dialog.dart';
import 'package:wan_flutter/common/utils/toast.dart';

class RegisterController extends GetxController {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController repasswordController = TextEditingController();

  registerUser() async {
    final username = usernameController.text;
    final password = passwordController.text;
    final repassword = repasswordController.text;

    if (username.isEmpty) {
      return toast('用户名不能为空');
    }
    if (password.isEmpty) {
      return toast('密码不能为空');
    }
    if (repassword.isEmpty) {
      return toast('确认密码不能为空');
    }
    if (password != repassword) {
      return toast('两次密码不一致');
    }

    showLoadingBox();
    var response = await UserApi.registerUser(username, password, repassword);

    var data = ObjectResponse<UserInfo?>.fromJson(
        response.data, (json) => UserInfo.fromJson(json));

    Get.back();
    if (data.errorCode == 0) {
      List<String>? cookies = response.headers['Set-Cookie'];
      WanHttpUtil.setHeadersCookies(cookies);
      SharedPreferencesUtil().setStringList('cookies', cookies ?? []);
      toast('注册成功!');
      // 回到登录页面
      Get.back(result: true);
    } else {
      toast(data.errorMsg);
    }
  }

  @override
  onClose() {
    super.onClose();
    usernameController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
  }
}
