import 'package:amazing/common/container/fContainer.dart';
import 'package:amazing/common/widgets/image/banner_roundedImage.dart';
import 'package:amazing/common/widgets/title_text/food_title_text.dart';
import 'package:amazing/data/controllers/food_controller.dart';
import 'package:amazing/features/personalization/models/food_model.dart';
import 'package:amazing/features/personalization/models/protein_model.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../extraction/favorite_extraction/favorite_icon.dart';
import '../../features/shop/screens/cart_items/widget/cart/food_add_to_cart.dart';
import '../../features/shop/screens/product_detail/widget/product_detail.dart';
import '../food_price/food_price.dart';
import '../widgets/icons/f_circular_icon.dart';

class food extends StatelessWidget {
  const food({super.key, required this.foods, this.title});

  final FoodModel foods;
  final String? title;


  @override
  Widget build(BuildContext context) {
    final controller = Food_Controller.instance;
    final dark = fHelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => Get.to(() => ProductDetailScreen(foods: foods)),

        child: Container(
            width: 150,
            height: 240,
           // padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              border: Border.all(
                   color: dark ? fColors.black : fColors.white,),
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
              // backgroundColor: fColors.light,
              child: Stack(
                children: [

                  /// ---- Thumbnail Image
                  fBannerImage(
                    height: 130,
                    width: 350,
                    fit: BoxFit.cover,backgroundColor: dark ? fColors.grey.withOpacity(0.1) : Colors.grey[100]!,

                    image: foods.image,isNetworkImage: true,
                  ),

                  /// --- Favourite IconButton
                  Positioned(
                      top: 0,
                      right: 0,
                      child: fcircular_favorite_icon(dark: dark,productId: foods.id,))
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
                title: foods.title,
                  smallSize: true,
                ),)]),

                const SizedBox(
                  height: 13,
                ), Padding(padding: const EdgeInsets.only(left: 3),
                  child: Row(
                    children: [
                      /// Price
                  foodprice(
                    price: controller.getFoodPrice(foods)),
                  const SizedBox(
                    height: 3,
                  ),])),
                 Row(
                   children: [
                 GestureDetector(onTap: (){},
                   child: food_add_to_Cart(dark: dark, foods: foods,),
                 )
                ],
              ),
           ] )) ]))),





    );
  }
}



