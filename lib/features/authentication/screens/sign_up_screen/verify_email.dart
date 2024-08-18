import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/fsize.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication_repositories.dart';
import '../../controllers/email_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        // Padding to Give Default Equal Space on all sides in all screens.
        child: Padding(
          padding: EdgeInsets.all(fSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(fImages.Email1),
                width: fHelperFunctions.screenWidth() * 0.6,),

              /// Title & SubTitle
              Text(
                "Confirm Email", style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium, textAlign: TextAlign.center,),
              SizedBox(height: fSizes.spaceBtwItems,),
              Text(email ?? "", style: Theme
                  .of(context)
                  .textTheme
                  .labelLarge, textAlign: TextAlign.center,),
              SizedBox(height: fSizes.spaceBtwItems,),
              Text("Congratulations! Your Account Awaits: Verify your Email to Start Shopping and Experience a world of Unrivated Deals and Personalized Offers", style: Theme
                  .of(context)
                  .textTheme
                  .labelMedium, textAlign: TextAlign.center,),
              SizedBox(height: fSizes.spaceBtwItems,),

              /// Buttons
              SizedBox(
                width: double.infinity,
             child:    ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: fColors.error,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),

                     )),     onPressed: () => controller.checkEmailVerificationStatus(),
                  child:  const Text("Continue",style: TextStyle(color: Colors.white),),),),
              SizedBox(
                height: fSizes.spaceBtwItems,),
              SizedBox(width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(), child:  const Text("Resend Email",style: TextStyle(color: Colors.black),),),)
            ],
          ),
        ),
      ),);
  }
}



