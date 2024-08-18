import 'package:amazing/features/fetching/model/sharwama_model.dart';
import 'package:get/get.dart';

class ShawarmaImageController extends GetxController {
  static ShawarmaImageController get instance => Get.find();

  /// Variables
  RxString selectedshawarmaImage = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getshawarmaImage(shawarmaModel shawar) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(shawar.image);

    /// Assign Thumbnail as Selected Image
    selectedshawarmaImage.value = shawar.image;

    // Get all images from the Product Model if not null.
    //if (food.image != null) {
    //images.addAll(food.image!);
    return images.toList();
  }
}