import 'package:amazing/features/authentication/service/google_controller.dart';
import 'package:amazing/features/fetching/model/sharwama_model.dart';
import 'package:amazing/features/fetching/repositories/shawarma_repositoories.dart';
import 'package:get/get.dart';


class shawarma_Controller extends GetxController {
  static shawarma_Controller get instance => Get.find();

  final isLoading = false.obs;
  final ShawarmaRepository = Get.put(shawarmaRepository());
  RxList<shawarmaModel> featuredShawar = <shawarmaModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedShawar();
    super.onInit();
  }

  void fetchFeaturedShawar() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final shawar = await ShawarmaRepository.getFeaturedShawar();

      // Assign Products
      featuredShawar.assignAll(shawar);
    } catch (e) {
      fLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getFoodPrice(shawarmaModel sharwa) {
    double recentPrice = sharwa.price ?? 0;
    if (recentPrice == 0) {
      return "Price not available";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }
}