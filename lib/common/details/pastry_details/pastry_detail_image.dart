import 'package:amazing/common/details/pastry_details/pastry_image_controller.dart';
import 'package:amazing/features/fetching/model/pastry_model.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amazing/utilis/device/device_utility.dart';

import '../../../../../common/appbar/fApp_bar.dart';
import '../../../extraction/favorite_extraction/favorite_icon.dart';


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
                            CircularProgressIndicator(value: downloadProgress.progress,color: dark ? Colors.transparent : Colors.transparent,
                            ),
                        fit: BoxFit.cover,
                        width: fDeviceUtilis.getScreenWidth(context),
                      );
                    })))),

            fAppBar(
              showBackArrow: true,
              actions: [
                fcircular_favorite_icon(dark: dark,productId: pastry.id,)])
              ],
            )
          );
  }
}
