import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../container/rounded_container.dart';
import '../../food_price/food_price.dart';
import '../icons/f_circular_icon.dart';
import '../image/all_in_crunches_images.dart';
import '../title_text/food_title_text.dart';

class favorite2 extends StatelessWidget {
  const favorite2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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

              child: const Stack(children: [

                /// Thumbnail Image
                fAllInCrunches(
                    width: 85,
                    fit: BoxFit.cover,
                    image: fImages.OfadaRice),
              ]),
            ),
            Column(children: [
              const SizedBox(
                  width: 200,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: fSizes.sm, left: fSizes.sm),
                    child: fFoodTitleText(
                      title: "Moi Moi (wrapped)",
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.only(right: 140),
                child: foodprice(
                  price: "1000",
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                      children: [
                        Padding(padding: const EdgeInsets.only(left: 6),
                   child:      Container(

                          alignment: Alignment.center,
                          width: 170,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: fColors.error),
                              borderRadius: BorderRadius.circular(6),
                            color: dark ? fColors.black : fColors.white,
                          ),

                          child: const Text(
                            "Add to bag",
                            style: TextStyle(color: fColors.error),
                          ),)
                        ), const SizedBox(width: 1,),
                        fCircularIcon(
                          icon: Iconsax.heart5,color: dark ? fColors.black : fColors.white,
                        )
                         ]))
            ])
          ])),
    );
  }
}
