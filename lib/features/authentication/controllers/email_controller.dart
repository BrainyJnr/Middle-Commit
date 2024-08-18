import 'dart:async';

import 'package:amazing/features/authentication/screens/loaders/floaders.dart';
import 'package:amazing/utilis/constants/image_strings.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../common/widgets/screen/success_screen.dart';
import '../../../data/repositories/authentication_repositories.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      fLoaders.successSnackBar(
          title: "Email Sent",
          message: "Please Check your inbox and verify your email");
    } catch (e) {
      fLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// Timer to automatically redirect an Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: fImages.SuccessEmail,
            title: "Your account has been created my Gee",
            subTitle: "Niceeeeeeeeeeeeeeeeeeeee one my Gee",
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  /// Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: fImages.SuccessEmail,
          title: "Your account has been created my Gee",
          subTitle: "Niceeeeeeeeeeeeeeeeeeeee one my Gee",
          onPressed: () =>
              AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
