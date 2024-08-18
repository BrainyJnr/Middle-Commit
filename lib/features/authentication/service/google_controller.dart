import 'package:get/get.dart';
import 'package:flutter/material.dart';

class fLoader {
  static void showLoader() {
    Get.dialog(
      const Center(child: CircularProgressIndicator()), // Replace with your custom loader
      barrierDismissible: false,
    );
  }

  static void stopLoading() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  static void errorSnackBar({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
