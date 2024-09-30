import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  var selectedIndex = 0.obs;
  late final PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedIndex.value);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  onPageChanged(index) {
    selectedIndex.value = index;
  }

  onDestinationSelected(index) {
    pageController.jumpToPage(index);
  }
}
