import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/pages/register/controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  //边框样式
  final OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(
    gapPadding: 0,
    borderSide: BorderSide(
      color: Color(0xFFE3E3D8),
    ),
  );

  InputDecoration getInputDecoration(String hintText) {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
        disabledBorder: _outlineInputBorder,
        errorBorder: _outlineInputBorder,
        isDense: true,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.never);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Scaffold(
      appBar: AppBar(title: const Text('注册')),
      body: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: controller.usernameController,
              decoration: getInputDecoration('用户名'),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: getInputDecoration('密码'),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: controller.repasswordController,
              obscureText: true,
              decoration: getInputDecoration('确认密码'),
            ),
            const SizedBox(height: 14),
            MaterialButton(
              disabledColor: const Color(0xFFfcf4e8),
              color: const Color(0xFFeec8bd),
              minWidth: double.infinity,
              height: 44,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              onPressed: controller.registerUser,
              child: const Text('注册', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
