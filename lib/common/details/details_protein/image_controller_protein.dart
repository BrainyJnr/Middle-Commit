import 'package:amazing/features/personalization/models/protein_model.dart';
import 'package:get/get.dart';

class ProteinImageController extends GetxController {
  static ProteinImageController get instance => Get.find();

  /// Variables
  RxString selectedProteinImage = "".obs;

  /// -- Get All Images from product and Variations
  List<String> getProtineImages(ProteinModel protein) {
    // Use Set to add unique Images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(protein.image);

    /// Assign Thumbnail as Selected Image
    selectedProteinImage.value = protein.image;

    // Get all images from the Product Model if not null.
    //if (food.image != null) {
    //images.addAll(food.image!);
    return images.toList();
  }
}