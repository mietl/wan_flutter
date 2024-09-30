import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
    final controller = Get.put(LoginController());
    return Scaffold(
        backgroundColor: const Color(0xFFf5f5f7),
        appBar: AppBar(
          // backgroundColor: const Color(0xFFe8dfd8),
          title: const Text('登录'),
          elevation: 4,
        ),
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                decoration: getInputDecoration('用户名'),
                controller: controller.usernameController,
              ),
              const SizedBox(height: 14),
              TextField(
                decoration: getInputDecoration('密码'),
                controller: controller.passwordController,
                obscureText: true,
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
                onPressed: controller.startLogin,
                child: const Text('登录', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 7.0),
              Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: controller.openRegister,
                    child: const Text('去注册',
                        style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline)),
                  ))
            ],
          ),
        ));
  }
}
