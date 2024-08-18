import 'package:amazing/features/authentication/service/google_controller.dart';
import 'package:amazing/features/personalization/models/protein_model.dart';
import 'package:get/get.dart';
import '../../repositories/protein_model.dart';

class Protein_Controller extends GetxController {
  static Protein_Controller get instance => Get.find();

  final isLoading = false.obs;
  final proteinRepository = Get.put(ProteinRepository());
  RxList<ProteinModel> featuredProtein = <ProteinModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProtein();
    super.onInit();
  }

  void fetchFeaturedProtein() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final proteins = await proteinRepository.getFeaturedProteins();

      // Assign Products
      featuredProtein.assignAll(proteins);
    } catch (e) {
      fLoader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getFoodPrice(ProteinModel proteins) {
    double recentPrice = proteins.price ?? 0;
    if (recentPrice == 0) {
      return "Price not available";
    }
    return "\u20A6${recentPrice.toStringAsFixed(0)}";
  }
}