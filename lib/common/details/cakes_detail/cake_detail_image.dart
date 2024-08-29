import 'package:amazing/common/details/cakes_detail/cake_detail_controller.dart';
import 'package:amazing/features/fetching/model/cake_model.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amazing/utilis/device/device_utility.dart';

import '../../../../../common/appbar/fApp_bar.dart';
import '../../../extraction/favorite_extraction/favorite_icon.dart';

class CakeDetailImage extends StatelessWidget {
  const CakeDetailImage({
    super.key,
    required this.cake,
  });

  final CakeModel cake;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final controller = Get.put(CakeImageController());
    final images = controller.getCakeImages(cake);

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
                  final images = controller.selectedCakeImage.value;
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
                }),
              ),
            ),
          ),

          fAppBar(
            showBackArrow: true,
            actions: [
              fcircular_favorite_icon(dark: dark, productId: cake.id,)
            ],
          ),
        ],
      ),
    );
  }
}
