import 'package:amazing/features/personalization/models/protein_model.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:amazing/utilis/device/device_utility.dart';

import '../../../../../common/appbar/fApp_bar.dart';
import '../../../../../common/widgets/icons/f_circular_icon.dart';
import '../../../extraction/favorite_extraction/favorite_icon.dart';
import 'image_controller_protein.dart';

class ProteinDetailImage extends StatelessWidget {
  const ProteinDetailImage({
    super.key,
    required this.protein,
  });

  final ProteinModel protein;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final ProteinImageController controller = Get.find<ProteinImageController>();

    // Fetch the image URL from the controller
    final imageUrl = controller.getProteinImages(protein);

    return Container(
      child: Stack(
        children: [
          /// Main Large Image
          SizedBox(
            height: 260,
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Center(
                child: Obx(() {
                  final imageUrl = controller.selectedProteinImage.value;
                  return CachedNetworkImage(
                    imageUrl: imageUrl,
                    progressIndicatorBuilder: (_, __, downloadProgress) =>
                        CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: dark ? Colors.transparent : Colors.transparent,
                        ),
                    fit: BoxFit.cover,
                    width: fDeviceUtilis.getScreenWidth(context),
                  );
                }),
              ),
            ),
          ),

          fAppBar(
            showBackArrow: true,
            actions: [
              fcircular_favorite_icon(dark: dark, productId: protein.id),
            ],
          ),
        ],
      ),
    );
  }
}
