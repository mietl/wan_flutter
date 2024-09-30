import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/api/user_api.dart';

class RegisterController extends GetxController {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController repasswordController = TextEditingController();

  registerUser() {
    final username = usernameController.text;
    final password = usernameController.text;
    final repassword = usernameController.text;

    UserApi.registerUser(username, password, repassword);
  }

  @override
  onClose() {
    super.onClose();
    usernameController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
  }
}
