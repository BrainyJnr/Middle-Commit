import 'package:amazing/features/authentication/controllers/logincontroller.dart';
import 'package:amazing/features/authentication/screens/login/login_screen.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());
    return ScreenUtilInit(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(50)),
              const Image(
                width: 150,
                height: 200,
                image: AssetImage(fImages.AppLogo),
              ),
              const FittedBox(
                fit: BoxFit.contain,
                child: Text("Sign in & Register",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 0,
              ),
              const FittedBox(
                fit: BoxFit.contain,
                child: Text("to",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 0,
              ),
              const FittedBox(
                fit: BoxFit.contain,
                child: Text("Amazing",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: ()  => controller.googleSignIn(),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: dark ? fColors.black : fColors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      //  onPressed: () {},
                      const Image(
                        width: 50,
                        image: AssetImage(fImages.GoogleLogo),
                      ),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Continue with Google",
                          style: TextStyle(color: dark ? fColors.white : fColors.black,
                          ),
                        ),
                      ),
                      const Spacer(),

                      Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey.withOpacity(0.10)),
                          child: const Icon(
                            Icons.arrow_forward,
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Get.to(const LoginScreen()),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                     // color: fColors.grey,
                    color: dark ? fColors.black : fColors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage(fImages.EmailLogo),
                      ),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Continue with Email",
                          style: TextStyle(color: dark ? fColors.white : fColors.black,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey.withOpacity(0.10)),
                          child: const Icon(
                            Icons.arrow_forward,
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ), //

              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 10),
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "${"By Continuing, you agree to our"} ",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    TextSpan(
                        text: "Terms & ",
                        style: TextStyle(color: Colors.red)),
                    //TextSpan(
                    //text:  "${"Conditons and privacy policy "} ",
                    //style: TextStyle(color: Colors.red,fontSize: 15)
                  ]))),
              const Text(
                "Conditions and privacy policy",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
      )),
    );
  }
}
