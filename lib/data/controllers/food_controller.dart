import 'package:amazing/features/authentication/service/google_controller.dart';
import 'package:amazing/features/personalization/models/food_model.dart';
import 'package:get/get.dart';
import '../../features/repositories/protein_model.dart';
import '../repositories/food_repositories.dart';

class Food_Controller extends GetxController {
  static Food_Controller get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(foodRepository());
  final proteinRepository = Get.put(ProteinRepository());
  RxList<FoodModel> featuredProducts = <FoodModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final foods = await productRepository.getFeaturedFoods();

      // Assign Products
      featuredProducts.assignAll(foods);
    } catch (e) {
      fLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getFoodPrice(FoodModel food) {
    double recentPrice = food.price ?? 0;
    if (recentPrice == 0) {
      return "Price Empty";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }
}