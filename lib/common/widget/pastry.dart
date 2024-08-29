import 'package:amazing/features/fetching/controller/pastry_controller.dart';
import 'package:amazing/features/fetching/model/pastry_model.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../extraction/favorite_extraction/favorite_icon.dart';
import '../../features/shop/screens/cart_items/widget/cart/pastry_add_to_cart.dart';
import '../container/fContainer.dart';
import '../details/pastry_details/pastry_detail_Screen.dart';
import '../food_price/food_price.dart';
import '../widgets/icons/f_circular_icon.dart';
import '../widgets/image/banner_roundedImage.dart';
import '../widgets/title_text/food_title_text.dart';

class pastry extends StatelessWidget {
  const pastry({super.key, required this.Pastry});

  final PastryModel Pastry;

  @override
  Widget build(BuildContext context) {
    final controller = pastry_Controller.instance;
    final dark = fHelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: GestureDetector(
          onTap: () => Get.to(() => PastryDetailScreen(pastry: Pastry)),
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
                    child: Stack(children: [
                      /// ---- Thumbnail Image
                      fBannerImage(
                        height: 130,
                        width: 350,
                        backgroundColor: dark ? fColors.grey.withOpacity(0.1) : Colors.grey[100]!,
                        fit: BoxFit.cover,
                        image: Pastry.image,
                        isNetworkImage: true,
                      ),

                      /// --- Favourite IconButton
                      Positioned(
                          top: 0,
                          right: 0,
                          child: fcircular_favorite_icon(dark: dark,productId: Pastry.id,))
                    ])),

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
                                title: Pastry.title,
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
                                    price: controller.getFoodPrice(Pastry)),
                                const SizedBox(
                                  height: 3,
                                ),
                              ])),
                          Row(
                            children: [
                              pastry_add_to_cart(dark: dark,pastry: Pastry)
                            ],
                          ),
                        ]))
              ]))),
    );
  }
}

