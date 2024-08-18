import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/first_home/first_home.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & Jump to next page.
  void nextPage() {
    if (currentPageIndex.value == 3) {
      final storage = GetStorage();

      if (kDebugMode) {
        print(
            "====================== GET STORAGE NEXT BUTTON =======================");
        print(storage.read("IsFirstTime"));
      }

      storage.write("IsFirstTime", false);


      if (kDebugMode) {
        print(
            "====================== GET STORAGE NEXT BUTTON =======================");
        print(storage.read("IsFirstTime"));
      }
        Get.offAll(const FrontScreen());
      } else {
        int page = currentPageIndex.value + 1;
        pageController.jumpToPage(page);
      }
    }

    /// Update Current Index & Jump to the last Page.
    void skipPage() {
      currentPageIndex.value = 3;
      pageController.jumpToPage(3);
    }
  }
