import 'package:amazing/common/container/rounded_container.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/heading/fSection_Heading.dart';

class billingpaymentsection extends StatelessWidget {
  const billingpaymentsection({super.key});

  @override
  Widget build(BuildContext context) {    var screenSize = MediaQuery.of(context).size;
  final dark = fHelperFunctions.isDarkMode(context);


  return Column(children: [
      const fSectionHeading(
        title: "Payment Method",
        buttonTitle: "Change",
      ),
      const SizedBox(
        height: 10,
      ),
            fRoundedContainer(
              width: screenSize.width,
              height: 50,
              borderColor: Colors.red,
              showBorder: true,
              backgroundColor: dark ? fColors.black : fColors.white,
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              child: Row(children: [
                fRoundedContainer(
                  width: 70,
                  height: 80,
                  backgroundColor: dark ? fColors.black : fColors.white,
                  //padding: EdgeInsets.only(left: 13, right: 110),
                  child: const Image(
                    image: AssetImage(fImages.PaypalLogo),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text("Paystack"),
                const SizedBox(
                  width: 140,
                ),const Spacer(),const Padding(padding: EdgeInsets.only(right: 12),
             child:    Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Colors.red,
                )
                )]),
            ),
          ],




      )
;  }
}
