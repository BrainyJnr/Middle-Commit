import 'package:amazing/features/fetching/model/drink_model.dart';
import 'package:get/get.dart';

class DrinkImageController extends GetxController {
  static DrinkImageController get instance => Get.find();

  /// Variables
  RxString selectedDrinkImage = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getDrinkImage(DrinkModel drink) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(drink.image);

    /// Assign Thumbnail as Selected Image
    selectedDrinkImage.value = drink.image;

    // Get all images from the Product Model if not null.
    //if (food.image != null) {
    //images.addAll(food.image!);
    return images.toList();
  }
}