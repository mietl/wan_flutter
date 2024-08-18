import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_flutter/common/api/user_api.dart';
import 'package:wan_flutter/common/models/user/user_info.dart';
import 'package:wan_flutter/common/models/wan_response.dart';
import 'package:wan_flutter/common/provider/user_provider.dart';
import 'package:wan_flutter/common/utils/http_util.dart';
import 'package:wan_flutter/common/utils/shared_preferences_util.dart';
import 'package:wan_flutter/common/utils/toast.dart';
import 'package:wan_flutter/common/utils/show_dialog.dart';
import 'package:wan_flutter/pages/home/index.dart';
class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}



class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController(text: 'mietl');
  TextEditingController passwordController = TextEditingController(text: 't22140127L');

  //边框样式
  final OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(
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

  _startLogin() async {
    var username = usernameController.text;
    var password = passwordController.text;

    if(username.isEmpty){
      return toast('用户名不能为空');
    }
    if(password.isEmpty){
      return toast('密码不能为空');
    }

    showLoadingBox(context,canPop: false);
    
    try{
       var response  = await UserApi.passwordLogin(username,password);
       toast('登录成功!');
       if(mounted){
         Navigator.pop(context);
       }

       List<String>? cookies = response.headers['Set-Cookie'];
       if(cookies!=null){
         WanHttpUtil.setCookies(cookies);

         var user  = ObjectResponse<UserInfo>.fromJson(response.data,(json)=>UserInfo.fromJson(json));
         if(mounted){
           Provider.of<UserProvider>(context,listen: false).setUserInfo(user.data);
           SharedPreferencesUtil().setStringList('cookies', cookies);
           // 首页
           Navigator.push(context, MaterialPageRoute(
             builder: (BuildContext context)=>const HomePage()
           ));
         }
       }
    }catch (e) {
      if(e is WanException){
        toast('登录失败: ${e.message}');
      }else{
        toast('登录失败: $e');
      }
      if(mounted){
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f7),
      appBar: AppBar(
        // backgroundColor: const Color(0xFFe8dfd8),
        title: const Text('登录'),
        elevation: 4,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: getInputDecoration('用户名'),
              controller: usernameController,
            ),
            const SizedBox( height: 14),
            TextField(
              decoration: getInputDecoration('密码'),
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 14),
            MaterialButton(
              disabledColor: const Color(0xFFfcf4e8),
              color: const Color(0xFFeec8bd),
              minWidth: double.infinity,
              height: 44,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              elevation: 0,
              onPressed: _startLogin,
              child: const Text('登录',style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 7.0),
            Align(
              alignment: Alignment.bottomRight,
              child:InkWell(
                onTap: (){

                },
                child: const Text('去注册',
                    style: TextStyle(fontSize: 16,decoration: TextDecoration.underline)
                ),
              )
            )
          ],
        ),
      )
    );
  }
}