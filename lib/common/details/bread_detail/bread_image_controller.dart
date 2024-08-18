import 'package:amazing/features/fetching/model/bread_model.dart';
import 'package:get/get.dart';

class BreadImageController extends GetxController {
  static BreadImageController get instance => Get.find();

  /// Variables
  RxString selectedBreadImage = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getBreadImages(BreadModel bread) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(bread.image);

    /// Assign Thumbnail as Selected Image
    selectedBreadImage.value = bread.image;

    // Get all images from the Product Model if not null.
    //if (food.image != null) {
    //images.addAll(food.image!);
    return images.toList();
  }
}