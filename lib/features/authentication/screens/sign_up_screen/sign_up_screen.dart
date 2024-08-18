import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Register New Account",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            body: const SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.only(
                        top: 0,
                        left: fSizes.defaultSpace,
                        right: fSizes.defaultSpace,
                        bottom: fSizes.defaultSpace),
                    child: Column(children: [
                      Image(
                          width: 210,
                          height: 150,
                          image: AssetImage(fImages.AppLogo)),
                      SIGNUP_FORM()])))));
  }
}

