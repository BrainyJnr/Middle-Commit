import 'package:amazing/common/appbar/fApp_bar.dart';
import 'package:amazing/common/widgets/heading/fSection_Heading.dart';
import 'package:amazing/navigation/navigation_menu.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/fsize.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/screen/success_screen.dart';
import 'checkout/billing_amount_section.dart';
import 'checkout/fbilling_address_section.dart';
import 'checkout/fbilling_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fAppBar(
        showBackArrow: true,
        title: Text("Check Out",style: Theme.of(context).textTheme.titleMedium,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, top: 5, right: 16),
        child:   Column(
          children: [
            const fSectionHeading(title: "Delivery Address",showActionButton: false,
            ),SizedBox(height: fSizes.spaceBtwItems,),
            const fBillingAddressSection(),

            const billingpaymentsection(),
            const SizedBox(height: 25),

            const Divider(),
            const BillingAmountSection(),

            const SizedBox(height: 22,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: fColors.error,
                  ),
                  onPressed: () =>  Get.to(SuccessScreen(
                    image: fImages.PaymentSuccessLogo,
                    title: "Payment Success",
                    subTitle: "Your item will be Delivered soon",
                    onPressed: () => Get.offAll(() => const Navigation_Menu()),
                  )),
                  child: const Text(
                    "Make Payment",
                    style: TextStyle(color: Colors.white),
                  )),
            ),


          ],
        ),

        ),
      ));
  }
}
