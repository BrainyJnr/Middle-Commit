import 'package:amazing/common/details/cakes_detail/cakes_detail_screen.dart';
import 'package:amazing/features/fetching/controller/cake_controller.dart';
import 'package:amazing/features/fetching/model/cake_model.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../container/fContainer.dart';
import '../food_price/food_price.dart';
import '../widgets/icons/f_circular_icon.dart';
import '../widgets/image/banner_roundedImage.dart';
import '../widgets/title_text/food_title_text.dart';

class Cakes extends StatelessWidget {
  const Cakes({super.key, required this.cakes});

  final CakeModel cakes;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final controller = Cake_Controller.instance;
    return SingleChildScrollView(
        child: GestureDetector(
            onTap: () =>
                Get.to(() => CakeDetailScreen(cake: cakes)),
            child: Container(
                width: 150,
                height: 240,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  //boxShadow: [fShadowStyle.verticalProductShadow],
                  borderRadius: BorderRadius.circular(10),
                  color: dark ? fColors.black : fColors.white,
                ),
                child: Column(children: [
                  /// --- Thumbnail, Wishist Button
                  fContainer(
                    height: 140,
                    backgroundColor: dark ? fColors.black : fColors.white,

                    //padding: EdgeInsets.all(fSizes.sm),
                    // backgroundColor: fColors.light,
                    child: Stack(
                      children: [
                        /// ---- Thumbnail Image
                        fBannerImage(
                          height: 130,
                          width: 350,
                          fit: BoxFit.cover,
                          image: cakes.image,
                          isNetworkImage: true,
                        ),

                        /// --- Favourite IconButton
                        Positioned(
                            top: 0,
                            right: 0,
                            child: fCircularIcon(
                              icon: Iconsax.heart5,
                              color: dark ? fColors.black : fColors.error,
                            ))
                      ],
                    ),
                  ),

                  /// --- Details
                  Padding(
                      padding: const EdgeInsets.only(left: fSizes.sm),
                      child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: fFoodTitleText(
                                  title: cakes.title,
                                  smallSize: true,
                                ),
                              )
                            ]),
                            const SizedBox(
                              height: 13,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Row(children: [
                                /// Price
                                foodprice(
                                    price: controller.getFoodPrice(cakes)),
                              ]),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                          ])),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 140,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: dark ? fColors.error : fColors.error,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          color: dark ? fColors.black : fColors.white,
                        ),
                        child: const Text(
                          "Add to bag",
                          style: TextStyle(),
                        ),
                      )
                    ],
                  ),
                ]))));
  }
}
