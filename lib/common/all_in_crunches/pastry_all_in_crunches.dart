import 'package:amazing/common/food_price/food_price.dart';
import 'package:amazing/common/widgets/icons/f_circular_icon.dart';
import 'package:amazing/common/widgets/title_text/food_title_text.dart';
import 'package:amazing/features/personalization/models/crunches_model.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../details/all_in_crunchies_detail/detail/all_in_cruchies_detail.dart';
import '../widgets/image/all_in_crunches_images.dart';

class pastry_all_in_crunches extends StatelessWidget {
  const pastry_all_in_crunches({
    super.key, required this.crunchy,
  });
  final CrunchesModel crunchy;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: GestureDetector(
            onTap: () => Get.to(() => AllInCrunchiesDetailScreen(crunchy: crunchy,)),
            child: Container(
              width: fDeviceUtilis.getScreenWidth(context),
              height: 250,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  // boxShadow: [fShadowStyle.verticalProductShadow],
                  borderRadius: BorderRadius.circular(fSizes.foodRadius)),
              child: Column(
                  children: [
                    /// All in Crunches Image, Wishlist Button
                    Stack(children: [
                      fAllInCrunches(
                        fit: BoxFit.cover,
                        width: fDeviceUtilis.getScreenWidth(context),
                        height: 200,
                        image: fImages.ChiExotic,
                      ),

                      /// --- Favorite Icon Button
                      Positioned(top: 0, right: 0,
                          child: fCircularIcon(
                              icon: Iconsax.heart5, color: Colors.red, onPressed: () {})),
                    ]),

                    /// --- Details
                    const Padding(padding: EdgeInsets.only(right: 193, top: 2),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 3),
                                        child:     fFoodTitleText(title: "Celebration Cake 12"))]),
                              Row(
                                children: [
                                  foodprice(price: "14,000")
                                ],
                              ),

                            ])

                    ),])
              ,
            )
        ));
  }
}
