import 'package:amazing/features/personalization/models/crunches_model.dart';
import 'package:get/get.dart';

class AllInCrunchiesImageController extends GetxController {
  static AllInCrunchiesImageController get instance => Get.find();

  /// Variables
  RxString selectedAllCrunchiesImage = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getAllImage(CrunchesModel crunchy) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(crunchy.image);

    /// Assign Thumbnail as Selected Image
    selectedAllCrunchiesImage.value = crunchy.image;

    // Get all images from the Product Model if not null.
    //if (food.image != null) {
    //images.addAll(food.image!);
    return images.toList();
  }
}