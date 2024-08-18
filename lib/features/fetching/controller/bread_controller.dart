import 'package:amazing/features/authentication/service/google_controller.dart';
import 'package:amazing/features/fetching/model/bread_model.dart';
import 'package:get/get.dart';
import '../repositories/bread_repositories.dart';

class Bread_Controller extends GetxController {
  static Bread_Controller get instance => Get.find();

  final isLoading = false.obs;
  final breadRepositories = Get.put(BreadRepositories());
  RxList<BreadModel> featuredBread = <BreadModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final Bread = await breadRepositories.getFeaturedBread();

      // Assign Products
      featuredBread.assignAll(Bread);
    } catch (e) {
      fLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getFoodPrice(BreadModel bread) {
    double recentPrice = bread.price ?? 0;
    if (recentPrice == 0) {
      return "Price not available";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }
}