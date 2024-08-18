import 'package:amazing/features/authentication/service/google_controller.dart';
import 'package:amazing/features/fetching/model/cake_model.dart';
import 'package:get/get.dart';
import '../repositories/cake_repositories.dart';

class Cake_Controller extends GetxController {
  static Cake_Controller get instance => Get.find();

  final isLoading = false.obs;
  final CakeRepository = Get.put(cakeRepository());
  RxList<CakeModel> featuredcakes = <CakeModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedpastry();
    super.onInit();
  }

  void fetchFeaturedpastry() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final cakes = await CakeRepository.getFeaturedCakes();

      // Assign Products
      featuredcakes.assignAll(cakes);
    } catch (e) {
      fLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getFoodPrice(CakeModel cake) {
    double recentPrice = cake.price ?? 0;
    if (recentPrice == 0) {
      return "Price not available";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }
}