import 'package:amazing/features/authentication/controllers/sign_up_controller.dart';
import 'package:amazing/features/authentication/screens/login/login_screen.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/validators/fvalidators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SIGNUP_FORM extends StatelessWidget {
  const SIGNUP_FORM({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full Name Field
          const Text("Full Name"),
          TextFormField(
            controller: controller.fullname,
            validator: (value) => fValidator.validateEmptyText("Full Name", value),
            cursorColor: Colors.red,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              hintText: "Enter your full Name",
              prefixIcon: Icon(Iconsax.user, color: Colors.red),
            ),
          ),
          const SizedBox(height: 15),

          // Email Field
          const Text("Email Address"),
          TextFormField(
            controller: controller.email,
            validator: (value) => fValidator.validateEmail(value),
            cursorColor: Colors.red,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              hintText: "Enter your Email",
              prefixIcon: Icon(Icons.email_rounded, color: Colors.red),
            ),
          ),
          const SizedBox(height: 15),

          // Phone Number Field
          const Text("Phone Number"),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => fValidator.validatePhoneNumber(value),
            cursorColor: Colors.red,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              hintText: "Enter your Phone Number",
              prefixIcon: Icon(Icons.phone, color: Colors.red),
            ),
          ),
          const SizedBox(height: 15),

          // Birthday Field
          const Text("Birthday"),
          TextFormField(
            controller: controller.birthday,
            validator: (value) => fValidator.validateEmptyText("Birthday", value),
            cursorColor: Colors.red,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              hintText: "Enter your Birthday Date",
              prefixIcon: Icon(Icons.wallet, color: Colors.red),
            ),
          ),
          const SizedBox(height: 15),

          // Password Field
          const Text("Password"),
          Obx(
            () =>  TextFormField(
              controller: controller.password,
              validator: (value) => fValidator.validatePassword(value),
              cursorColor: Colors.red,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                hintText: "Enter your Password",

                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                  !controller.hidePassword.value,
                  icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
                  prefixIcon: const Icon(Icons.lock_open, color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Register Button
          SizedBox(
            width: double.infinity,
            height: 50,
           child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: fColors.error,
              ),
              onPressed: () => controller.signup(),

           child: const Text( "Register account",
                style: TextStyle(color: Colors.white),
              ),
            )),

          const SizedBox(height: 15),

          // Sign In Link
          Padding(
            padding: const EdgeInsets.only(left: 65),
            child: GestureDetector(
              onTap: () => Get.to(const LoginScreen()),
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "or "),
                    TextSpan(
                      text: "Sign in ",
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(text: "with your account"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



