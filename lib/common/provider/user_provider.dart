import 'package:flutter/material.dart';
import 'package:wan_flutter/common/models/user/user_info.dart';

class UserProvider extends ChangeNotifier {
  bool get loginStatus => userInfo != null;

  UserInfo? userInfo;

  setUserInfo(UserInfo? value){
    userInfo = value;
    notifyListeners();
  }
}