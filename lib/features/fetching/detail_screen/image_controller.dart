import 'package:amazing/features/personalization/models/food_model.dart';

import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  /// Variables
  RxString selectedFoodImage = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getFoodImages(FoodModel foods) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(foods.image);

    /// Assign Thumbnail as Selected Image
    selectedFoodImage.value = foods.image;

    // Get all images from the Product Model if not null.
    //if (food.image != null) {
    //images.addAll(food.image!);
    return images.toList();
  }
}