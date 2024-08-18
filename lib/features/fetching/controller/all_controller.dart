import 'package:amazing/features/authentication/service/google_controller.dart';
import 'package:amazing/features/fetching/model/all_model.dart';
import 'package:amazing/features/fetching/repositories/all_repositories.dart';
import 'package:get/get.dart';


class All_Controller extends GetxController {
  static All_Controller get instance => Get.find();

  final isLoading = false.obs;
  final allRepository = Get.put(AllRepository());
  RxList<AllModel> featuredAll = <AllModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedAll();
    super.onInit();
  }

  void fetchFeaturedAll() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final all = await allRepository.getFeaturedAll();

      // Assign Products
      featuredAll.assignAll(all);
    } catch (e) {
      fLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getAllPrice(AllModel all) {
    double recentPrice = all.price ?? 0;
    if (recentPrice == 0) {
      return "Price empty";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }
}