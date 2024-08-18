import 'package:amazing/features/authentication/screens/loaders/floaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user_repositories.dart';
import '../../personalization/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;


  final userRepository = Get.put(UserRepository());
  final imageUploading = false.obs;
  final hidePassword = false.obs;
  final verifyPassword = TextEditingController();
  final verifyEmail = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First Update Rx User and then check if user data is already stored. if not store new data.
      await fetchUserRecord();

      // if no record already stored.
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert Name to First and Last Name
          final nameParts =
          UserModel.nameParts(userCredentials.user!.displayName ?? "");
          final username =
          UserModel.generateUsername(userCredentials.user!.displayName ?? "");

          // Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            birthday: nameParts[0],
            fullName: nameParts[0],
            email: userCredentials.user!.email ?? "",
            phoneNumber: userCredentials.user!.phoneNumber ?? "",
          );

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      fLoaders.warningSnackBar(
        title: "Data not Saved",
        message:
        "Something went wrong while saving your information. You can re-save your data in your Profile",
      );
    }
  }

  /// Delete Account Warning


}