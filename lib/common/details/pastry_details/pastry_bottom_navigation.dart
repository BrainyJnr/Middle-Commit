import 'package:amazing/common/food_price/food_price.dart';
import 'package:amazing/features/fetching/controller/pastry_controller.dart';
import 'package:amazing/features/fetching/model/pastry_model.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class PastryBottomAddToCart extends StatelessWidget {
  const PastryBottomAddToCart({super.key, required this.pastry});

  final PastryModel pastry;

  @override
  Widget build(BuildContext context) {
    final controller = pastry_Controller.instance;
    final dark = fHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: fSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? fColors.black : fColors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18))),


      height: 70,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: const EdgeInsets.only(top: 9,left: 15,right: 28),
                  // Container(
                  // width: 50,
                  //height: 100,
                  child:   foodprice(
                    price: controller.getFoodPrice(pastry),
                  ),),]),


          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                  width: 235 ,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: fColors.error),
                  child: Center(
                    child: Text(
                      "Add to Bag",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .apply(color: Colors.white),
                    ),
                  )))
        ],
      ),

    );
  }
}
