import 'package:amazing/features/authentication/service/google_controller.dart';
import 'package:amazing/features/fetching/model/drink_model.dart';
import 'package:amazing/features/fetching/repositories/drink_repositories.dart';
import 'package:get/get.dart';


class Drink_Controller extends GetxController {
  static Drink_Controller get instance => Get.find();

  final isLoading = false.obs;
  final drinkRepository = Get.put(DrinkRepository());
  RxList<DrinkModel> featuredDrink = <DrinkModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedDrink();
    super.onInit();
  }

  void fetchFeaturedDrink() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final drink = await drinkRepository.getFeaturedDrinks();

      // Assign Products
      featuredDrink.assignAll(drink);
    } catch (e) {
      fLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getFoodPrice(DrinkModel drink) {
    double recentPrice = drink.price ?? 0;
    if (recentPrice == 0) {
      return "Price not available";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }
}