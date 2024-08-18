import 'package:amazing/common/details/shawarma/shawarma_detail_screen.dart';
import 'package:amazing/features/fetching/controller/sharwarma_controller.dart';
import 'package:amazing/features/fetching/model/sharwama_model.dart';
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

class SHAWARMAR extends StatelessWidget {
  const SHAWARMAR({super.key, required this.shawar});

  final shawarmaModel shawar;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final controller = shawarma_Controller.instance;
    return SingleChildScrollView(
      child: GestureDetector(
          onTap: () => Get.to(() => ShawarmaDetailScreen(warma: shawar,)),

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
              child: Column(
                  children: [

                    /// --- Thumbnail, Wishist Button
                    fContainer(
                      height: 140,
                      backgroundColor: dark ? fColors.black : fColors.white,
                      //padding: EdgeInsets.all(fSizes.sm),
                      child: Stack(
                        children: [

                          /// ---- Thumbnail Image
                          fBannerImage(
                            height: 130,
                            width: 350,
                            fit: BoxFit.cover,
                            image: shawar.image,isNetworkImage: true,
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
                              Row(
                                  children: [
                                    Padding(padding: const EdgeInsets.only(left: 3),

                                      child:   fFoodTitleText(
                                        title: shawar.title,
                                        smallSize: true,
                                      ),)]),

                              const SizedBox(
                                height: 13,
                              ), Padding(padding: const EdgeInsets.only(left: 3),
                                  child: Row(
                                      children: [
                                        /// Price
                                        foodprice(
                                            price: controller.getFoodPrice(shawar)),
                                        const SizedBox(
                                          height: 3,
                                        ),])),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 140,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: fColors.error),
                                        borderRadius: BorderRadius.circular(6),
                                      color: dark ? fColors.black : fColors.white,
                                    ),
                                    child: const Text(
                                      "Add to bag", style: TextStyle(color: fColors.error),),
                                  )
                                ],
                              ),
                            ] )) ]))),





    );
  }
}
