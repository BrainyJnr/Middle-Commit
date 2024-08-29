import 'package:amazing/features/fetching/model/cake_model.dart';
import 'package:get/get.dart';

class CakeImageController extends GetxController {
  static CakeImageController get instance => Get.find();

  /// Variables
  RxString selectedCakeImage = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getCakeImages(CakeModel cake) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Load thumbnail image
    if (cake.image.isNotEmpty) {
      images.add(cake.image);
      // Assign Thumbnail as Selected Image
      selectedCakeImage.value = cake.image;
    }

    return images.toList();
  }
}
