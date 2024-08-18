import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:amazing/utilis/constants/fsize.dart';

import '../../../../common/container/rounded_container.dart';

class fBillingAddressSection extends StatelessWidget {
  const fBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return fRoundedContainer(
        padding: EdgeInsets.all(fSizes.md),
              width: double.infinity,
            height: 120,
          borderColor: Colors.grey.withOpacity(0.2),
                 showBorder: true,backgroundColor: dark ? fColors.black : fColors.white,
                  margin: EdgeInsets.only(bottom: fSizes.spaceBtwItems),
              child: Stack(
                   children: [
             const Positioned(
           right : 5,
          top: 0,
               child: Icon(
                 Icons.location_on,color: Colors.red,
               ),),
                     Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children:[
                           //  Padding(padding:EdgeInsets.only( right: 50,

                           Text("Home", maxLines:1, overflow:TextOverflow.ellipsis, style:Theme.of(context).textTheme.titleMedium),
                           SizedBox(height: fSizes.md / 2),

                           Text("Douglas Street", maxLines:1, overflow:TextOverflow.ellipsis, style:Theme.of(context).textTheme.titleSmall),
                           SizedBox(height: fSizes.md / 2),
                           Text("08153573951", maxLines:1, overflow:TextOverflow.ellipsis, style:Theme.of(context).textTheme.titleSmall),

                         ])]
              )  );
  }
}
