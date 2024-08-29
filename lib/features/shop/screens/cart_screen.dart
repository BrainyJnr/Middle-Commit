import 'package:amazing/common/appbar/fAppBarsec.dart';
import 'package:amazing/features/authentication/screens/loaders/animated_loader.dart';
import 'package:amazing/features/shop/screens/address/address_screen.dart';
import 'package:amazing/features/shop/screens/cart_items/fcart_items.dart';
import 'package:amazing/features/shop/screens/cart_items/widget/controller/cart_controller.dart';
import 'package:amazing/navigation/navigation_menu.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'cart_items/widget/fCouponCode.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: fAppBarSec(
        showBackArrow: true,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Obx(() {
        // Display this widget when the cart is empty
        final emptyWidget = fAnimationLoaderWidget(
          text: "Whoops! Cart is Empty",
          image: fImages.Animation1,
          showAction: true,
          actionText: "Let's fill it",
          onActionPressed: () => Get.offAll(Navigation_Menu()),
        );

        // Check if cart is empty
        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 22, top: 5, right: 16),
              child: Column(
                children: [
                  // List of Cart Items
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.cartItems.length,
                    itemBuilder: (_, index) {
                      final item = controller.cartItems[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Cart Item Display
                          fCartScreen(cartItem: item),
                          const SizedBox(height: 12),
                        ],
                      );
                    },
                  ),
                  Divider(color: Colors.grey.withOpacity(0.3)),

                  const SizedBox(height: 8),

                  // Coupon Code Section
                  const fCouponCode(),
                  const SizedBox(height: fSizes.spaceBtwSections),

                  // Pricing Section
                  Column(
                    children: [
                      // Total Items Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Items",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            controller.noOfCartItems.value.toString(),
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: fSizes.spaceBtwItems / 1),

                      // Subtotal Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "\u20A6${controller.totalCartPrice.value}",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Divider(),
                      const SizedBox(height: 13),

                      // Total Amount Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "\u20A6${controller.totalCartPrice.value}",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),

                      // Checkout Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Padding(padding: EdgeInsets.only(bottom: 3),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: fColors.error,
                            ),
                            onPressed: () => Get.to(const addresscreen()),
                            child: const Text(
                              "Check Out",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
