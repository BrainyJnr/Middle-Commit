import 'package:amazing/features/authentication/service/google_controller.dart';
import 'package:amazing/features/fetching/model/icecream_model.dart';
import 'package:amazing/features/fetching/repositories/icecream_repositories.dart';
import 'package:get/get.dart';


class IceCrean_Controller extends GetxController {
  static IceCrean_Controller get instance => Get.find();

  final isLoading = false.obs;
  final IceRepo = Get.put(IceCreamRepositories());
  RxList<IceModel> featuredIceCream = <IceModel>[].obs;

  @override
  void onInit() {
    fetchFeatureIceCream();
    super.onInit();
  }

  void fetchFeatureIceCream() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final Cream = await IceRepo.getFeaturedIceCream();

      // Assign Products
      featuredIceCream.assignAll(Cream);
    } catch (e) {
      fLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getCreamPrice(IceModel Cream) {
    double recentPrice = Cream.price ?? 0;
    if (recentPrice == 0) {
      return "Price not available";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }
}