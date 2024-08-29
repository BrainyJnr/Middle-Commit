import 'package:amazing/common/widget/food_home.dart';
import 'package:amazing/features/fetching/model/all_model.dart';
import 'package:amazing/features/personalization/models/food_model.dart';
import 'package:amazing/features/shop/screens/cart_items/widget/controller/cart_controller.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class food_add_to_Cart extends StatelessWidget {
  const food_add_to_Cart({
    super.key,
    required this.dark,
    required this.foods,
    //required this.all, required this.cruch,
  });

  final FoodModel foods;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        final cartItem = cartController.convertToCartItem(foods, 1);
        cartController.addOneToCart(cartItem);
      },
      child: Obx(() {
        final productQuatityInCart = cartController.getProductQuantityInCart(
            foods.id);
        return Container(
          alignment: Alignment.center,
          width: 140,
          height: 38,
          decoration: BoxDecoration(
            border: Border.all(color: fColors.error),
            borderRadius: BorderRadius.circular(6),
            color: productQuatityInCart > 0 ? fColors.error : dark ? fColors
                .darkerGrey : fColors.white,
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
                      cartController.convertToCartItem(foods, 1)
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
                  onPressed: controller.productQuantityInCart.value > 0
                      ? () {
                    cartController.addOneToCart(
                        cartController.convertToCartItem(foods, 1));
                  }
                      : null,
                ),
              ),
            ],
          )
              : InkWell(
            onTap: () {
              final cartItem = cartController.convertToCartItem(foods, 1);
              cartController.addOneToCart(cartItem);
            },
            child: Text(
              "Add to bag",
              style: TextStyle(color: fColors.error),
            ),
          ),
        );
      } )
        );
      }


  }

