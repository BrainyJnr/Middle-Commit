import 'package:get/get.dart';

import '../../../features/fetching/model/promo_model.dart';

class PromoImageController extends GetxController {
  static PromoImageController get instance => Get.find();

  /// Variables
  RxString selectedPromoImage = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getPromoImage(PromoModel promo) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(promo.image);

    /// Assign Thumbnail as Selected Image
    selectedPromoImage.value = promo.image;

    // Get all images from the Product Model if not null.
    //if (food.image != null) {
    //images.addAll(food.image!);
    return images.toList();
  }
}