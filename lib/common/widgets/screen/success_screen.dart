import 'package:amazing/common/widgets/screen/widget/space_styles.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed,});

  final String image,title,subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(padding: fSpacingStyle.paddingWithAppBarHeight * 2,
            child: Column(
              children: [
                /// Image
                Image(image:  AssetImage(image),width: fHelperFunctions.screenWidth() * 6,),
                 const SizedBox(height: fSizes.spaceBtwSections,),

                /// Title & SubTitle
                Text(
                  title, style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge, textAlign: TextAlign.center,),
                const SizedBox(height: fSizes.spaceBtwItems,),
                Text(subTitle, style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium, textAlign: TextAlign.center,),
                const SizedBox(height: fSizes.spaceBtwItems,),

                /// Buttons
                SizedBox(width: double.infinity,height: 50,
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: fColors.error,
                  ),
                    onPressed: onPressed,child: const Text("Continue",style: TextStyle(color: Colors.white),),),
                )
              ],
            ),
          )
      ),
    );
  }
}
