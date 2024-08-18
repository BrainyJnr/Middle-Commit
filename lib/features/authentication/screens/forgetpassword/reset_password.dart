import 'package:amazing/features/authentication/controllers/forget_controller.dart';
import 'package:amazing/features/authentication/screens/login/login_screen.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(fSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: const AssetImage(fImages.SuccessEmail),width: fHelperFunctions.screenWidth() * 6,),
              const SizedBox(height: fSizes.spaceBtwSections,),

              /// Title & SubTitle
              Text(email, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),
              const SizedBox(height: fSizes.spaceBtwItems,),
              Text("No one is above forgetting his/her password follow the procedure to reset password", style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: fSizes.spaceBtwItems,),

              /// Buttons
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: fColors.error,

                  ),
                  onPressed: () => Get.offAll(() =>  const LoginScreen()),child:  Text("Done",style:Theme.of(context).textTheme.titleMedium!.apply(color: Colors.white),),
              ),),
              const SizedBox(height: fSizes.spaceBtwItems,),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),child: const Text("Resend Email",style: TextStyle(color: Colors.black),),),
              )
            ],
          ),
        ),
      ),
    );
  }
}