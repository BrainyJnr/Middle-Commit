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
    images.add(pastry.image);

    /// Assign Thumbnail as Selected Image
    selectedPastryImage.value = pastry.image;

    // Get all images from the Product Model if not null.
    //if (food.image != null) {
    //images.addAll(food.image!);
    return images.toList();
  }
}