import 'package:amazing/features/authentication/controllers/user_controller.dart';
import 'package:amazing/features/authentication/screens/loaders/floaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/repositories/authentication_repositories.dart';
import '../../../utilis/managers/network_managers.dart';

class LoginController extends GetxController {
  /// Variables
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final isLoading = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  /// -- Email and Password Sign-In
  Future<void> emailAndPasswordSignIn() async {
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
      if (!loginFormKey.currentState!.validate()) {
        fLoaders.stopLoading();
        return;
      }

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      fLoaders.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      fLoaders.stopLoading();
      fLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  /// -- Google Sign-In Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      fLoaders.showLoader();

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        fLoaders.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      fLoaders.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    }catch (e) {
      // Remove Loader
      fLoaders.stopLoading();
      fLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }}



