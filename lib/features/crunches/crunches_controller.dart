import 'package:amazing/features/authentication/service/google_controller.dart';
import 'package:amazing/features/crunches/crunches_repositories.dart';
import 'package:amazing/features/personalization/models/crunches_model.dart';
import 'package:get/get.dart';

class Crunchies_Controller extends GetxController {
  static Crunchies_Controller get instance => Get.find();

  final isLoading = false.obs;
  final crunchesRepository = Get.put(CrunchesRepository());
  RxList<CrunchesModel> featuredCrunches = <CrunchesModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedCrunchies();
    super.onInit();
  }

  void fetchFeaturedCrunchies() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final crunch = await crunchesRepository.getFeaturedCrunches();

      // Assign Products
      featuredCrunches.assignAll(crunch);
    } catch (e) {
      fLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getCrucnesPrice(CrunchesModel crunch) {
    double recentPrice = crunch.price ?? 0;
    if (recentPrice == 0) {
      return "Price not available";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }
}