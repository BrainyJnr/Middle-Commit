import 'package:amazing/features/fetching/model/pastry_model.dart';
import 'package:get/get.dart';

class PastryImageController extends GetxController {
  static PastryImageController get instance => Get.find();

  /// Variables
  RxString selectedPastryImage = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getPastryImages(PastryModel pastry) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Load thumbnail image
    if (pastry.image.isNotEmpty) {
      images.add(pastry.image);
      selectedPastryImage.value = pastry.image; // Update the selected image
    }

    return images.toList();
  }
}
