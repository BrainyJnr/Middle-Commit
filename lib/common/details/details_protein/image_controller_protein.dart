import 'package:get/get.dart';
import 'package:amazing/features/personalization/models/protein_model.dart';

class ProteinImageController extends GetxController {
  static ProteinImageController get instance => Get.find();

  /// Variables
  RxString selectedProteinImage = "".obs;

  /// Get all images from the protein model
  List<String> getProteinImages(ProteinModel protein) {
    // Use Set to ensure unique images only
    Set<String> images = {};

    // Check if the protein image is not null or empty
    if (protein.image != null && protein.image.isNotEmpty) {
      // Load thumbnail image
      images.add(protein.image);

      // Assign Thumbnail as Selected Image
      selectedProteinImage.value = protein.image;
    }

    // Optionally, add more images if available in the ProteinModel
    // Example: if (protein.images != null) {
    //   images.addAll(protein.images);
    // }

    // Return images as a list
    return images.toList();
  }
}
