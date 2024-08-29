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
    if (crunchy.image.isNotEmpty) {
      images.add(crunchy.image);
      selectedAllCrunchiesImage.value = crunchy.image;
    }

    // Return images as a list
    return images.toList();
  }
}
