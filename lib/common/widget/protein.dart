import 'package:amazing/common/details/details_protein/protein_detail.dart';
import 'package:amazing/features/fetching/controller/protein_controller.dart';
import 'package:amazing/features/personalization/models/protein_model.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../extraction/favorite_extraction/favorite_icon.dart';
import '../../features/shop/screens/cart_items/widget/cart/protein_add_to_cart.dart';
import '../container/fContainer.dart';
import '../food_price/food_price.dart';
import '../widgets/icons/f_circular_icon.dart';
import '../widgets/image/banner_roundedImage.dart';
import '../widgets/title_text/food_title_text.dart';

class protein extends StatelessWidget {
  const protein({super.key, required this.proteins});

  final ProteinModel proteins;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final controller = Protein_Controller.instance;
    return SingleChildScrollView(
        child: GestureDetector(
      onTap: () => Get.to(() => ProteinDetailScreen(
            protein: proteins,
          )),
      child: Container(
          width: 150,
          height: 240,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.1)),
            //boxShadow: [fShadowStyle.verticalProqductShadow],
            borderRadius: BorderRadius.circular(10),
            color: dark ? fColors.black : fColors.white,
          ),
          child: Column(children: [
            /// --- Thumbnail, Wishist Button
            fContainer(
                height: 140,
                // padding: EdgeInsets.all(fSizes.sm),
                // backgroundColor: fColors.light,
                backgroundColor: dark ? fColors.black : fColors.white,
                child: Stack(children: [
                  /// ---- Thumbnail Image
                  fBannerImage(
                    backgroundColor: dark ? fColors.grey.withOpacity(0.1) : Colors.grey[100]!                ,
                    height: 130,
                    width: 350,
                    fit: BoxFit.cover,
                    image: proteins.image,
                    isNetworkImage: true,
                  ),

                  /// --- Favourite IconButton
                  Positioned(
                      top: 0,
                      right: 0,
                      child: fcircular_favorite_icon(dark: dark,productId: proteins.id,))
                ])),

            /// --- Details
            Padding(
                padding: const EdgeInsets.only(left: fSizes.sm),
                child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: fFoodTitleText(
                            title: proteins.title,
                            smallSize: true,
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Row(children: [
                          /// Price
                          foodprice(price: controller.getFoodPrice(proteins)),
                        ]),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          protein_add_to_cart(dark: dark, protein: proteins)
                        ],
                      ),
                    ]))
          ])),
    ));
  }
}

