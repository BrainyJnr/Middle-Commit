import 'package:flutter/material.dart';


class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
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
          Text("1",style: Theme.of(context).textTheme.titleSmall,),
        ],
      ),const SizedBox(height: 7,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.titleSmall,),
            Text("\u20A6800000",style: Theme.of(context).textTheme.titleSmall,),
          ],
        ),
        const SizedBox(height: 7,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Delivery Fee",style: Theme.of(context).textTheme.titleSmall,),
            Text("\u20A6800000",style: Theme.of(context).textTheme.titleSmall,),
          ],
        ),const SizedBox(height: 22,),
        const Divider(),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Amount",style: Theme.of(context).textTheme.titleSmall,),
              Text("\u20A6800000",style: Theme.of(context).textTheme.titleSmall,)
            ],
        )

   ] );
  }
}
