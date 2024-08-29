import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/appbar/fApp_bar.dart';
import '../../../common/widgets/heading/fSection_Heading.dart';
import 'address/model/address_model.dart';
import 'checkout/billing_amount_section.dart';
import 'checkout/fbilling_address_section.dart';
import 'checkout/fbilling_payment_section.dart';
import 'order_tabBars/widgets/order_controller.dart';
import 'package:amazing/features/authentication/screens/loaders/floaders.dart';
import 'package:amazing/features/shop/screens/address/controller/address_controller.dart';
import 'package:amazing/features/shop/screens/cart_items/widget/controller/cart_controller.dart';
import 'package:amazing/features/shop/screens/cart_items/widget/model/cart_item_model.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/pricing_calculator.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final orderController = Get.put(OrderController());
    final addressController = Get.put(AddressController());

    // Fetch subtotal from cartController
    final double subTotal = cartController.totalCartPrice.value;
    final totalAmount = fPricingCalculator.calculateTotalPrice(subTotal, "NGN");

    // Assuming cartController provides a method to get the cart items
    final cartItems = cartController.cartItems;

    // Placeholder variables for demonstration
    final AddressModel? address = addressController.selectedAddress.value;
    final List<CartItemModel> itemDetails = cartItems;

    return Scaffold(
      appBar: fAppBar(
        showBackArrow: true,
        title: Text(
          "Check Out",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, top: 5, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const fSectionHeading(
                title: "Delivery Address",
                showActionButton: false,
              ),
              SizedBox(height: fSizes.spaceBtwItems),
              const fBillingAddressSection(),
              const billingpaymentsection(),
              const SizedBox(height: 25),
              const Divider(),
              const BillingAmountSection(),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: fColors.error,
                  ),
                  onPressed: () async {
                    if (address != null && itemDetails.isNotEmpty) {
                      // Aggregate the order data into separate lists for each item
                      String titles = itemDetails
                          .map((item) => item.title ?? "")
                          .join("\n");
                      List<String> imageUrls =
                          itemDetails.map((item) => item.image ?? "").toList();

                      // Process the order with the aggregated data
                      await orderController.processOrder(
                        totalAmount: totalAmount,
                        title: titles,

                        imageUrls: imageUrls,
                        address: addressController.selectedAddress.value,
                      );

                    } else {
                      // Handle the case where address is null or itemDetails is empty
                      fLoaders.warningSnackBar(
                        title: "Empty Cart",
                        message: "Add items to the cart in order to proceed",
                      );
                    }


                  },
                  child: Text("Make Payment",style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
