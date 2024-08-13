import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}



class _LoginPageState extends State<LoginPage> {
  //边框样式
  final OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    gapPadding: 0,
    borderSide: BorderSide(
      color: Color(0xFFE3E3D8),
    ),
  );


  InputDecoration getInputDecoration(String hintText){
      return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
        disabledBorder: _outlineInputBorder,
        errorBorder: _outlineInputBorder,
        isDense: true,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.never
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
      ),
      body:  Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            TextField(
              decoration: getInputDecoration('用户名'),
            ),
            const SizedBox( height: 14),
            TextField(
              decoration: getInputDecoration('密码'),
              obscureText: true,
            ),
            const SizedBox(height: 14),
            MaterialButton(
              color: const Color(0xFFf0908c),
              textColor: Colors.white,
              minWidth: double.infinity,
              height: 44,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              elevation: 0,
              onPressed: (){

              },
              child: const Text('登录',style: TextStyle(fontSize: 16)),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: (){
                  print('register');
                },
                child: const Text('去注册',
                    style: TextStyle(fontSize: 16,decoration: TextDecoration.underline)
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}