import 'package:amazing/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  Color getTabColor(int index) {
    return selectedIndex.value == index
        ? fColors.error
        : Colors.grey.withOpacity(0.2);
  }

  Color getTextColor(int index) {
    return selectedIndex.value == index
        ? fColors.white
        : Colors.black;
  }
}
class ColorChangeController extends GetxController {
  var selectedIndex = 0.obs;
}

