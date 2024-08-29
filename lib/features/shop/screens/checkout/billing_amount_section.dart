import 'package:amazing/features/shop/screens/cart_items/widget/controller/cart_controller.dart';
import 'package:amazing/utilis/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';


class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final cartController = CartController.instance;
    final subtotal = cartController.totalCartPrice.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        const SizedBox(height: 5,),
          Text("Your Order",style: Theme.of(context).textTheme.titleMedium,),
        const SizedBox(
          height: 5,
        ),
        const SizedBox(height: 8,),
        /// Total Item
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total Item",style: Theme.of(context).textTheme.titleSmall,),
          Text(controller.noOfCartItems.value.toString(),style: Theme.of(context).textTheme.titleSmall,),
        ],
      ),const SizedBox(height: 7,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.titleSmall,),
            Text("\u20A6${subtotal}",style: Theme.of(context).textTheme.titleSmall,),
          ],
        ),
        const SizedBox(height: 7,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Delivery Fee",style: Theme.of(context).textTheme.titleSmall,),
            Text("\u20A6${fPricingCalculator.calculateShippingCost(subtotal, "NGN")}",style: Theme.of(context).textTheme.titleSmall,),
          ],
        ),const SizedBox(height: 22,),
        const Divider(),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Amount",style: Theme.of(context).textTheme.titleSmall,),
              Text("\u20A6${fPricingCalculator.calculateTotalPrice(subtotal, "NGN")}",style: Theme.of(context).textTheme.titleSmall,)
            ],
        )

   ] );
  }
}
