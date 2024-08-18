import 'package:amazing/common/appbar/fApp_bar.dart';
import 'package:amazing/features/shop/screens/address/address_screen.dart';
import 'package:amazing/features/shop/screens/cart_items/fcart_items.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_items/widget/fCouponCode.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: fAppBar(
          showBackArrow: true,
          title: Text(
            "Cart",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 22, top: 5, right: 16),
              child: Column(children: [
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  shrinkWrap: true,
                  //  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (_, __) => const fCartScreen(),
                ),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.3),
                ),
                const SizedBox(
                  height: 8,
                ),
                const fCouponCode(),
                const SizedBox(height: fSizes.spaceBtwSections,),
          
                  /// Pricing
                  Column(
                    children: [
                      Column(
                        children: [
                          /// TOTAL
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Item",style: Theme.of(context).textTheme.labelLarge,),
                              Text("1",style: Theme.of(context).textTheme.labelLarge,),
          
                            ],
                          ),
                          const SizedBox(height: fSizes.spaceBtwItems / 1,),
          
                          /// Subtotal
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Subtotal",style: Theme.of(context).textTheme.labelLarge,),
                              Text("\u20A61000",style: Theme.of(context).textTheme.labelLarge,)
                            ],
                          ),const SizedBox(height: 40,),
                          const Divider(),
                          const SizedBox(height: 13,),
          
                          /// Total
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Amount",style: Theme.of(context).textTheme.labelLarge,),
                              Text("\u20A61000",style: Theme.of(context).textTheme.labelLarge,)
          
                        ],),const SizedBox(height: 22,),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: fColors.error,
                                ),
                                onPressed: () => Get.to(const addresscreen()),
                                child: const Text(
                                  "Check Out",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
          
          
                    ],
                  ),
          
              ])])
              ),
        ));
  }
}

