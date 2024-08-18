import 'package:amazing/features/authentication/service/google_controller.dart';
import 'package:amazing/features/fetching/model/promo_model.dart';
import 'package:amazing/features/fetching/repositories/promo_repositories.dart';
import 'package:get/get.dart';


class Promo_Controller extends GetxController {
  static Promo_Controller get instance => Get.find();

  final isLoading = false.obs;
  final promoRepository = Get.put(PromoRepository());
  RxList<PromoModel> featuredPromo = <PromoModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedPromo();
    super.onInit();
  }

  void fetchFeaturedPromo() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final promo = await promoRepository.getFeaturedPromo();

      // Assign Products
      featuredPromo.assignAll(promo);
    } catch (e) {
      fLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getFoodPrice(PromoModel promo) {
    double recentPrice = promo.price ?? 0;
    if (recentPrice == 0) {
      return "Price not available";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }
}