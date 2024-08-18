import 'package:amazing/features/authentication/screens/loaders/floaders.dart';
import 'package:amazing/features/authentication/screens/sign_up_screen/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/authentication_repositories.dart';
import '../../../data/repositories/user_repositories.dart';
import '../../../utilis/managers/network_managers.dart';
import '../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final fullname = TextEditingController();
  final birthday = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- SIGNUP
  void signup() async {
    try {
      // Start Loading
      fLoaders.showLoader();
      // "We are processing your information...", fImages.Animation1,);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        fLoaders.showLoader();
        return;
      }
      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        fLoaders.stopLoading();

        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        fLoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
            "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.");
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      // Save Authenticated user data in the FireStore
      final newUser = UserModel (

        id: userCredential.user!.uid,
        fullName: fullname.text.trim(),
        birthday: birthday.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      fLoaders.stopLoading();

      // Show Success Message
      fLoaders.successSnackBar(title: "Congratulations", message: "Your account has been created Verify email to continue.");

      // Move to Verify Email Screen
      Get.to(()=> VerifyEmailScreen(email: email.text.trim(),));

    } catch (e) {
      // Remove Loader
      fLoaders.stopLoading();

      // Show some Generic Error to the user
      fLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      // Remove Loader
    }
  }
}

