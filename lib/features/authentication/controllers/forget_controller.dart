import 'package:amazing/features/authentication/screens/forgetpassword/reset_password.dart';
import 'package:amazing/features/authentication/screens/loaders/floaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/authentication_repositories.dart';
import '../../../utilis/managers/network_managers.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      fLoaders.showLoader();

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        fLoaders.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        fLoaders.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(
          email.text.trim());

      // Remove Loader
      fLoaders.stopLoading();

      // Show Success Screen
      fLoaders.successSnackBar(title: "Email Sent,",
          message: "Email Link Sent to Reset your Password".tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      fLoaders.stopLoading();
      fLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }


  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      fLoaders.showLoader();

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        fLoaders.stopLoading();
        return;
      }


      await AuthenticationRepository.instance.sendPasswordResetEmail(
          email);

      // Remove Loader
      fLoaders.stopLoading();

      // Show Success Screen
      fLoaders.successSnackBar(title: "Email Sent,",
          message: "Email Link Sent to Reset your Password".tr);

    } catch (e) {
      // Remove Loader
      fLoaders.stopLoading();
      fLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
