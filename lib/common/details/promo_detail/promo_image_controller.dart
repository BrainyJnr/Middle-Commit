import 'package:get/get.dart';
import '../../../features/fetching/model/promo_model.dart';

class PromoImageController extends GetxController {
  // Singleton pattern to access the controller instance
  static PromoImageController get instance => Get.find();

  // Observable for the selected promo image
  RxString selectedPromoImage = "".obs;

  /// Get all images from the promo model
  List<String> getPromoImages(PromoModel promo) {
    // Use a Set to ensure unique images
    Set<String> images = {};

    // Check if the promo image is not null or empty
    if (promo.image != null && promo.image.isNotEmpty) {
      // Load thumbnail image
      images.add(promo.image);

      // Assign Thumbnail as Selected Image
      selectedPromoImage.value = promo.image;
    }

    // Optionally, add more images if available in the PromoModel
    // Example: if (promo.images != null) {
    //   images.addAll(promo.images);
    // }

    // Return images as a list
    return images.toList();
  }
}
