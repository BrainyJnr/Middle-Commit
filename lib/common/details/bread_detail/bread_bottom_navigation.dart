import 'package:amazing/common/food_price/food_price.dart';
import 'package:amazing/features/fetching/controller/bread_controller.dart';
import 'package:amazing/features/fetching/model/bread_model.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../features/shop/screens/cart_items/widget/controller/cart_controller.dart';


class BreadBottomAddToCart extends StatelessWidget {
  const BreadBottomAddToCart({super.key, required this.bread});

  final BreadModel bread;

  @override
  Widget build(BuildContext context) {
    final controller = Bread_Controller.instance;
    final cartscontroller = CartController.instance;
    final cartController = CartController.instance;
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
                Padding(
                  padding: const EdgeInsets.only(top: 9, left: 15, right: 28),
                  // Container(
                  // width: 50,
                  //height: 100,
                  child: foodprice(
                    price: controller.getFoodPrice(bread),
                  ),),
              ]),


          InkWell(onTap: () {
            final cartItem = cartController.convertToCartItem(bread, 1);
            cartController.addOneToCart(cartItem);
          },
              child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Obx(() {
                    final productQuatityInCart = cartController
                        .getProductQuantityInCart(
                        bread.id);
                    return   Container(
                        width: 180,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: productQuatityInCart > 0 ? fColors.error : dark ? fColors
                              .darkerGrey : fColors.error,
                        ),
                        child: productQuatityInCart > 0
                            ? Row(
                          // mainAxisAlignment: MainAxisAlignment.m,
                          children: [
                            Expanded(
                              child: IconButton(
                                icon: Icon(Icons.remove, color: fColors.white),
                                onPressed: () {
                                  // cartController.removeOneFromCart(
                                  //cartController.convertToCartItem(foods, 1));
                                  cartController.removeFromCart(
                                      cartController.convertToCartItem(bread, 1)
                                  );
                                },
                              ),
                            ),
                            Text(
                              productQuatityInCart.toString(),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(color: fColors.white),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: Icon(Icons.add, color: fColors.white),
                                onPressed: cartscontroller.productQuantityInCart
                                    .value > 0
                                    ? () {
                                  cartController.addOneToCart(
                                      cartController.convertToCartItem(
                                          bread, 1));
                                }
                                    : null,
                              ),
                            ),
                          ],
                        )
                            : InkWell(
                          onTap: () {
                            final cartItem = cartController.convertToCartItem(
                                bread, 1);
                            cartController.addOneToCart(cartItem);
                          },
                          child: Center(
                            child: Text(
                              "Add to bag",
                              style: TextStyle(color: fColors.white),
                            ),
                          ),
                        )

                    );
                  })
              )
          )
        ],
      ),

      // padding: EdgeInsets.symmetric(horizontal: fSizes.defaultSpace,vertical: fSizes.defaultSpace / 2),
    );
  }
}
