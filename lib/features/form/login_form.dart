import 'package:amazing/features/authentication/controllers/logincontroller.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/validators/fvalidators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../authentication/screens/forgetpassword/forget_password_screen.dart';

class Login_Form extends StatelessWidget {
  const Login_Form({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Email Address"),
            TextFormField(
              controller: controller.email,
              validator: (value) => fValidator.validateEmail(value),
              cursorColor: Colors.red,
              expands: false,
              decoration: InputDecoration(focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                  //labelText: "Email Address",
                  hintText: "Enter your Email",
                  hintStyle:
                  Theme.of(context).textTheme.bodySmall,
                  prefixIcon: const Icon(
                    Icons.email_rounded,
                    color: Colors.red,
                  )),
            ),
            const SizedBox(
              height: 18,
            ),
            const Text("Password"),
            Obx(
              () =>  TextFormField(
                controller: controller.password,
                validator: (value) => fValidator.validateEmptyText("Password", value),
                expands: false,
                cursorColor: Colors.red,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                  fillColor: Colors.red,
                  prefixIcon: const Icon(
                    Icons.lock_open,
                    color: Colors.red,
                  ),
                  hintText: "Enter your Password",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                      icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
              ),
            ),),
            const SizedBox(height: 2),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () => Get.to(const Forgetpasswordscreen()),
                    child: Text("Forget Password",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall))),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: fColors.error,
                  ),
                  onPressed: () => controller.emailAndPasswordSignIn(),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white),
                  )),
            ),

          ]),
    );
  }
}
