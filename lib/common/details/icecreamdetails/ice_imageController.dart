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
    images.add(ice.image);

    /// Assign Thumbnail as Selected Image
    selectedIceImage.value = ice.image;

    // Get all images from the Product Model if not null.
    //if (food.image != null) {
    //images.addAll(food.image!);
    return images.toList();
  }
}