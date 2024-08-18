import 'package:amazing/common/food_price/food_price.dart';
import 'package:amazing/features/crunches/crunches_controller.dart';
import 'package:amazing/features/personalization/models/crunches_model.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class AllInCruchiesbottomAddToCart extends StatelessWidget {
  const AllInCruchiesbottomAddToCart({super.key, required this.crunchy});

  final CrunchesModel crunchy;

  @override
  Widget build(BuildContext context) {
    final controller = Crunchies_Controller.instance;
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
                    price: controller.getCrucnesPrice(crunchy),
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
