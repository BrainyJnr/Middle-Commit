import 'package:amazing/common/details/pastry_details/pastry_image_controller.dart';
import 'package:amazing/features/fetching/model/pastry_model.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:amazing/utilis/device/device_utility.dart';

import '../../../../../common/appbar/fApp_bar.dart';
import '../../../../../common/widgets/icons/f_circular_icon.dart';


class PastryDetailImage extends StatelessWidget {
  const PastryDetailImage({
    super.key,
    required this.pastry,
  });

  final PastryModel pastry;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final controller = Get.put(PastryImageController());
    final images = controller.getPastryImages(pastry);
    return Container(
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
                height: 260,
                child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Center(child: Obx(() {
                      final images = controller.selectedPastryImage.value;
                      return CachedNetworkImage(
                        imageUrl: images,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(value: downloadProgress.progress,color: dark ? fColors.black : fColors.error,
                            ),
                        fit: BoxFit.cover,
                        width: fDeviceUtilis.getScreenWidth(context),
                      );
                    })))),

            fAppBar(
              showBackArrow: true,
              actions: [
                fCircularIcon(
                  icon: Iconsax.heart5,
                  color: dark ? fColors.black : fColors.error,
                )
              ],
            )
          ],
        ));
  }
}
