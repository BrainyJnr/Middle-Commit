import 'package:amazing/features/personalization/models/food_model.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  // Singleton pattern to access the controller instance
  static ImageController get instance => Get.find();

  // Observable for selected food image
  RxString selectedFoodImage = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getFoodImages(FoodModel food) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Check if the food image is not null or empty
    if (food.image != null && food.image.isNotEmpty) {
      // Load thumbnail image
      images.add(food.image);

      // Assign Thumbnail as Selected Image
      selectedFoodImage.value = food.image;
    }

    // Return images as a list
    return images.toList();
  }
}
