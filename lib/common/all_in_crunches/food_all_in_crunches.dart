import 'package:amazing/common/details/all_in_crunchies_detail/detail/all_in_cruchies_detail.dart';
import 'package:amazing/common/food_price/food_price.dart';
import 'package:amazing/common/widgets/icons/f_circular_icon.dart';
import 'package:amazing/common/widgets/title_text/food_title_text.dart';
import 'package:amazing/features/crunches/crunches_controller.dart';
import 'package:amazing/features/personalization/models/crunches_model.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/device/device_utility.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../extraction/favorite_extraction/favorite_icon.dart';
import '../widgets/image/all_in_crunches_images.dart';

class food_all_in_crunches extends StatelessWidget {
  const food_all_in_crunches({
    super.key,
    required this.crunch,
  });

  final CrunchesModel crunch;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final controller = Crunchies_Controller.instance;
    return SingleChildScrollView(
        child: GestureDetector(
            onTap: () =>
                Get.to(() => AllInCrunchiesDetailScreen(crunchy: crunch)),
            child: Container(
              width: fDeviceUtilis.getScreenWidth(context),
              height: 250,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: dark ? fColors.black : fColors.white,
                  // boxShadow: [fShadowStyle.verticalProductShadow],
                  borderRadius: BorderRadius.circular(fSizes.foodRadius)),
              child: Column(children: [
                /// All in Crunches Image, Wishlist Button
                Stack(children: [
                  fAllInCrunches(
                    fit: BoxFit.cover,
                    width: fDeviceUtilis.getScreenWidth(context),
                    height: 200,
                    image: crunch.image,
                    isNetworkImage: true,
                  ),

                  /// --- Favorite Icon Button
                  Positioned(
                      top: 0,
                      right: 0,
                      child: fcircular_favorite_icon(
                        dark: dark,
                        productId: crunch.id,
                      ))
                ]),

                /// --- Details
                Padding(
                    padding: const EdgeInsets.only(right: 170, top: 2),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: fFoodTitleText(title: crunch.title))
                          ]),
                          Row(
                            children: [
                              foodprice(
                                  price: controller.getCrucnesPrice(crunch))
                            ],
                          ),
                        ])),
              ]),
            )));
  }
}
