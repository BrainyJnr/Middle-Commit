import 'package:amazing/common/details/shawarma/shawarma_imagecontroller.dart';
import 'package:amazing/features/fetching/model/sharwama_model.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amazing/utilis/device/device_utility.dart';

import '../../../../../common/appbar/fApp_bar.dart';
import '../../../extraction/favorite_extraction/favorite_icon.dart';

class ShawarmaDetailImage extends StatelessWidget {
  const ShawarmaDetailImage({
    super.key,
    required this.warma,
  });

  final shawarmaModel warma;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final controller = Get.put(ShawarmaImageController());
    final images = controller.getshawarmaImage(warma);

    return Container(
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
                height: 260,
                child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Center(child: Obx(() {
                      final images = controller.selectedshawarmaImage.value;
                      return CachedNetworkImage(
                        imageUrl: images,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: dark ? Colors.transparent : Colors.transparent,
                            ),
                        fit: BoxFit.cover,
                        width: fDeviceUtilis.getScreenWidth(context),
                      );
                    })))),

            fAppBar(
              showBackArrow: true,
              actions: [
                fcircular_favorite_icon(dark: dark, productId: warma.id,)
              ],
            ),
          ],
        ));
  }
}
