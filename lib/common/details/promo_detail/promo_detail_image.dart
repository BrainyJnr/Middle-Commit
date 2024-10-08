import 'package:amazing/common/details/promo_detail/promo_image_controller.dart';
import 'package:amazing/features/fetching/model/promo_model.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:amazing/utilis/device/device_utility.dart';
import 'package:flutter/scheduler.dart';

import '../../../../../common/appbar/fApp_bar.dart';
import '../../../../../common/widgets/icons/f_circular_icon.dart';
import '../../../extraction/favorite_extraction/favorite_icon.dart';

class PromoDetailImage extends StatelessWidget {
  const PromoDetailImage({
    super.key,
    required this.promo,
  });

  final PromoModel promo;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final controller = Get.put(PromoImageController());

    // Defer the state change to after the widget is built
    SchedulerBinding.instance.addPostFrameCallback((_) {
      controller.getPromoImages(promo);
    });

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
                  final images = controller.selectedPromoImage.value;
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
              fcircular_favorite_icon(dark: dark, productId: promo.id),
            ],
          ),
        ],
      ),
    );
  }
}
