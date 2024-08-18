import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/container/rounded_container.dart';

class fCouponCode extends StatelessWidget {
  const fCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return fRoundedContainer(
      showBorder: true,
      borderColor: Colors.grey.withOpacity(0.3),
      backgroundColor: dark ? fColors.black : fColors.white,

      padding: const EdgeInsets.only(
        //top: fSizes.sm,
          top: 0,bottom: 0,
          // bottom: fSizes.sm,
          left: 5,right: 0

      ),
      child: Row(
        children: [const Icon(Icons.code,color: fColors.green,),const SizedBox(width: 20,),
          Container(color: Colors.grey.withOpacity(0.4),width: 1,height: 39,),
          const SizedBox(width: 20,),

          /// TextField
          Flexible(
              child: TextFormField(cursorColor: Colors.black45,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 5),

                  hintText: "Coupon Code",
                  border: InputBorder.none,

                ),
              ) ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: fColors.green
                ),
                onPressed: (){}, child: const Text("Apply",style: TextStyle(color: Colors.white),)),
          ),
        ],
      ),
    );
  }
}
