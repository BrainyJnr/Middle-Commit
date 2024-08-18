import 'package:amazing/features/shop/screens/cart_items/widget/add_remove_button.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:amazing/common/container/rounded_container.dart';
import 'package:amazing/common/food_price/food_price.dart';
import 'package:amazing/common/widgets/title_text/food_title_text.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:amazing/utilis/constants/sizes.dart';

import '../../../../common/widgets/image/all_in_crunches_images.dart';

class fCartScreen extends StatelessWidget {
  const fCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return SizedBox(
        width: 100,
        height: 90,
        child: Container(
            width: 320,
            height: 100,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(5),
              color: dark ? fColors.black : fColors.white,
            ),
            child: Stack(children: [
              ///  Image
              fRoundedContainer(
                height: 130,
                padding: const EdgeInsets.all(fSizes.sm),
                backgroundColor: dark ? fColors.black : fColors.white,

                child: fAllInCrunches(
                    width: 85,
                    height: 120,backgroundColor: dark ? fColors.black : fColors.white,

                    fit: BoxFit.cover,
                    image: fImages.RedVelvet),
              ),

              /// Title and Price
              const Column(children: [
                SizedBox(
                  width: 267,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 15, left: fSizes.sm),
                    child: fFoodTitleText(title: "Red Velvet")),

                Padding(
                    padding: EdgeInsets.only(right: 17),
                    child: foodprice(price: "1000",)),
              ]),
              const fProductQuatityaddandremovebutton() ,
            ])));
  }
}

