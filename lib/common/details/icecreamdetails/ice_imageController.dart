import 'package:amazing/features/fetching/model/icecream_model.dart';
import 'package:get/get.dart';

class IceCreamImageController extends GetxController {
  static IceCreamImageController get instance => Get.find();

  /// Variables
  RxString selectedIceImage = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getIceImages(IceModel ice) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Load thumbnail image
    if (ice.image.isNotEmpty) {
      images.add(ice.image);
      // Assign Thumbnail as Selected Image
      selectedIceImage.value = ice.image;
    }

    return images.toList();
  }
}
