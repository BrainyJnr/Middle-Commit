import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/container/rounded_container.dart';

class fSingleAddress extends StatelessWidget {
  const fSingleAddress({super.key, required this.selectedAddress,

  });
  final bool selectedAddress;


  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return  fRoundedContainer(
      padding: const EdgeInsets.all(fSizes.md),
      width: double.infinity,
      height: 150,backgroundColor: dark ? fColors.black : fColors.white,
      borderColor: selectedAddress ? Colors.red : Colors.grey.withOpacity(0.3),
      showBorder: true,
      margin: const EdgeInsets.only(bottom: fSizes.spaceBtwItems),
      child: Stack(
        children: [
         Positioned(
            right : 5,
          top: 0,
     child: GestureDetector(onTap: (){},
       child: const Icon(
              Iconsax.edit,color: Colors.red,
            ),
     ),) ,
      Positioned(
        right : 5,
        bottom: 0,
       child:    GestureDetector(onTap: (){},
            child: const Icon(
              Icons.delete,color: Colors.red,
            ),
          ),),
          Positioned(
            left: 0,
        bottom: 0,top: 90,
        child:   Row(
          mainAxisAlignment: MainAxisAlignment.start,
        children:[
           Checkbox(
            checkColor: Colors.white,activeColor: Colors.red,
            //fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
              value: selectedAddress ? true : false, onChanged: (value){},),
          const SizedBox(width: 0,),
          const Text("Use as the Delivery address",style: TextStyle(fontSize: 12),)


        ]
      )),


          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
            //  Padding(padding:EdgeInsets.only( right: 50,

               Text("Home", maxLines:1, overflow:TextOverflow.ellipsis, style:Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: fSizes.md / 2),

              Text("Douglas Street", maxLines:1, overflow:TextOverflow.ellipsis, style:Theme.of(context).textTheme.titleSmall),
               const SizedBox(height: fSizes.md / 2),
              Text("08153573951", maxLines:1, overflow:TextOverflow.ellipsis, style:Theme.of(context).textTheme.titleSmall),

            ]
    )]
      )
    );


     }
}
