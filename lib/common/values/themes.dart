import 'package:flutter/material.dart';
import 'package:wan_flutter/common/values/color.dart';

final leafTheme = ThemeData.light().copyWith(
    primaryColor: WanColor.errorRed,
    colorScheme: ColorScheme.fromSeed(seedColor: WanColor.errorRed));

final seedTheme = ThemeData.light().copyWith(
    primaryColor: WanColor.catechinaGreen,
    colorScheme: ColorScheme.fromSeed(seedColor: WanColor.catechinaGreen));
