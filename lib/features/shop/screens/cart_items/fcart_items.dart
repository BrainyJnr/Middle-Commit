import 'package:amazing/features/shop/screens/cart_items/widget/add_remove_button.dart';
import 'package:amazing/features/shop/screens/cart_items/widget/controller/cart_controller.dart';
import 'package:amazing/features/shop/screens/cart_items/widget/model/cart_item_model.dart';
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
  const fCartScreen(
      {super.key, this.showAddRemoveButtons = true, required this.cartItem});

  final bool showAddRemoveButtons;
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final dark = fHelperFunctions.isDarkMode(context);
    return SizedBox(
        width: 500,
        height: 95,
        child: Container(
          width: 320,
          height: 130,
          padding: const EdgeInsets.all(8),
          // Padding for the entire container
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(5),
            color: dark ? fColors.black : fColors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              fAllInCrunches(
                width: 85,
                height: 120,
                backgroundColor: dark ? fColors.black : fColors.white,
                fit: BoxFit.cover,
                image: cartItem.image ?? "",
                isNetworkImage: true,
              ),
              const SizedBox(width: 10),
              // Space between the image and the text section

              // Title, Price, and Quantity Buttons Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 02, top: 5, right: 5),
                  // Padding for text and buttons
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Aligns items to the start
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // Space between title and buttons
                    children: [
                      fFoodTitleText(
                        title: cartItem.title ?? "",
                        maxLines: 2,
                      ),
                      SizedBox(width: 30,),
                      // Ensure title wraps and doesn't overflow
                      foodprices(
                        price: (cartItem.price * cartItem.quantity)
                            .toStringAsFixed(0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // Align quantity buttons to the end
                        children: [
                          fProductQuatityaddandremovebutton(
                            quantity: cartItem.quantity,
                            add: () => cartController.addOneToCart(cartItem),
                            remove: () =>
                                cartController.removeFromCart(cartItem),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
