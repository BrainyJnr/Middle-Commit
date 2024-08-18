import 'package:amazing/features/authentication/controllers/user_controller.dart';
import 'package:amazing/features/fetching/controller/all_controller.dart';
import 'package:get/get.dart';

import '../utilis/managers/network_managers.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(UserController());
    Get.put(All_Controller());


    }}