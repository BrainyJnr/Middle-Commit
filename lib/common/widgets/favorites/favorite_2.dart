import 'package:amazing/features/fetching/controller/all_controller.dart';
import 'package:amazing/features/fetching/model/all_model.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../extraction/favorite_extraction/favorite_icon.dart';
import '../../container/rounded_container.dart';
import '../../food_price/food_price.dart';
import '../icons/f_circular_icon.dart';
import '../image/all_in_crunches_images.dart';
import '../title_text/food_title_text.dart';
import 'favorite_add_to_cart.dart';

class favorite2 extends StatelessWidget {
  const favorite2({
    super.key, required this.all,
  });

  final AllModel all;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(All_Controller());
    final dark = fHelperFunctions.isDarkMode(context);
    return SizedBox(
      width: 100,
      height: 110,
      child: Container(
          width: 320,
          height: 100,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(5),
            color: dark ? fColors.black : fColors.white,
          ),
          child: Row(children: [

            /// Thumbnail
            fRoundedContainer(
              height: 100,
              padding: const EdgeInsets.all(fSizes.sm),
              backgroundColor: dark ? fColors.black : fColors.white,

              child:  Stack(children: [

                /// Thumbnail Image
                fAllInCrunches(
                    width: 85,
                    fit: BoxFit.cover,
                    image: all.image,isNetworkImage: true,),
              ]),
            ),
            Column(children: [
               SizedBox(
                  width: 200,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: fSizes.sm, left: fSizes.sm),
                    child: fFoodTitleText(
                      title: all.title,
                    ),
                  )),
               Padding(
                padding: EdgeInsets.only(right: 140),
                child: foodprice(
                  price: controller.getAllPrice(all),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                      children: [
                        Padding(padding: const EdgeInsets.only(left: 6),
                   child:      favorite_add_to_cart(dark: dark, all: all,)
                        ), const SizedBox(width: 1,),
                        fcircular_favorite_icon(dark: dark,productId: all.id,)])

              )
                         ])])
      )

    );
  }
}

