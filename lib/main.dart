import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_flutter/common/provider/user_provider.dart';
import 'package:wan_flutter/common/utils/http_util.dart';
import 'package:wan_flutter/common/utils/shared_preferences_util.dart';
import 'package:wan_flutter/common/values/color.dart';
import 'package:wan_flutter/pages/main/index.dart';
// import 'package:wan_flutter/pages/login/index.dart';

void main() {
   // 确保Flutter框架初始化完成
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesUtil.init().then((value){
    var cookie = SharedPreferencesUtil().getStringList('cookie');
    WanHttpUtil.setCookies(cookie);
  });
  
 

  runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (BuildContext context)=> UserProvider(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wan_flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: WanColor.phoenixPurple),
        useMaterial3: true,
      ),
      home: const MainPageView()
    );
  }
}

