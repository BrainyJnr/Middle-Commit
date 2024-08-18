import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../form/login_form.dart';
import '../sign_up_screen/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Sign In",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(fSizes.defaultSpace),
                  child: Column(children: [
                    const Image(
                      width: 210,
                      height: 170,
                      image: (AssetImage(fImages.AppLogo)),
                    ),
                    const Login_Form(),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(height: 15,),
                    Padding(padding: const EdgeInsets.only(right: 5),
                      child: GestureDetector(
                        onTap: () => Get.to(() => const SignUpScreen()),
                    child:    const Text.rich(TextSpan(
                         children: [
                           TextSpan(
                               text: "${"or" } "),
                           TextSpan(
                             text: "${"Register" } ",
                             style: TextStyle(color: Colors.red)
                           ),
                           TextSpan(
                             text: "a new account"
                           )
                         ]
                       ))

                        ),
                      ),

                  ])))),
    );
  }
}

