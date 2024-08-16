import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  bool _loginStatus = false;

  bool get loginStatus => _loginStatus;

  changeLoginStatus(status){
    _loginStatus = status;
    notifyListeners();
  }
}