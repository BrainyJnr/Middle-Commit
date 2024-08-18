import 'package:amazing/features/authentication/controllers/user_controller.dart';
import 'package:amazing/features/authentication/screens/loaders/floaders.dart';
import 'package:amazing/navigation/navigation_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/repositories/user_repositories.dart';
import '../../../utilis/managers/network_managers.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();


  var  fullName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();


  /// Init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch User record
  Future<void> initializeNames() async {
    fullName.text = userController.user.value.fullName;
  }

  Future<void> updateUserName() async {
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
      if (!updateUserNameFormKey.currentState!.validate()) {
        fLoaders.stopLoading();
        return;
      }

      // Update User`s first & last name in the Firebase FireStore
      Map<String, dynamic> name = {
        "FullName": fullName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.fullName = fullName.text.trim();
      //userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      fLoaders.stopLoading();

      // Show Success Message
      fLoaders.successSnackBar(
          title: "Congratulations", message: "Your Name has been updated");

      // Move to previous screen.
      Get.offAll(() => const Navigation_Menu());
    } catch (e) {
      fLoaders.stopLoading();
      fLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}

