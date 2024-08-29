import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/fsize.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:amazing/utilis/device/device_utility.dart';

import '../../../../../common/appbar/fApp_bar.dart';
import '../../../../../common/widgets/icons/f_circular_icon.dart';
import '../../../../../extraction/favorite_extraction/favorite_icon.dart';
import '../../../../fetching/detail_screen/image_controller.dart';
import '../../../../personalization/models/food_model.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({
    super.key,
    required this.foods,
  });

  final FoodModel foods;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final ImageController controller = Get.find();
    final images = controller.getFoodImages(foods);

    return Stack(
      children: [
        /// Main Large Image
        SizedBox(
          height: 300,
          width: fDeviceUtilis.getScreenWidth(context),
          child: Center(
            child: Obx(() {
              final imageUrl = controller.selectedFoodImage.value;
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

        fAppBar(
          showBackArrow: true,
          actions: [
            fcircular_favorite_icon(dark: dark, productId: foods.id),
          ],
        ),
      ],
    );
  }
}
