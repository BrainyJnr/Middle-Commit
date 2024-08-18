import 'package:amazing/features/authentication/service/google_controller.dart';
import 'package:amazing/features/fetching/model/pastry_model.dart';
import 'package:amazing/features/fetching/repositories/pastry_repositories.dart';
import 'package:get/get.dart';


class pastry_Controller extends GetxController {
  static pastry_Controller get instance => Get.find();

  final isLoading = false.obs;
  final pastryRepository = Get.put(PastryRepository());
  RxList<PastryModel> featuredPastry = <PastryModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedPastry();
    super.onInit();
  }

  void fetchFeaturedPastry() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final pastry = await pastryRepository.getFeaturedPastry();

      // Assign Products
      featuredPastry.assignAll(pastry);
    } catch (e) {
      fLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getFoodPrice(PastryModel pastry) {
    double recentPrice = pastry.price ?? 0;
    if (recentPrice == 0) {
      return "Price not available";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }
}