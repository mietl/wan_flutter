import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/values/themes.dart';

class AppThemeController extends GetxController {
  var currentTheme = seedTheme.obs;

  void changeTheme(ThemeData theme) {
    currentTheme.value = theme;
  }
}
