import 'package:amazing/features/authentication/controllers/forget_controller.dart';
import 'package:amazing/utilis/constants/fsize.dart';
import 'package:amazing/utilis/validators/fvalidators.dart';
import 'package:flutter/material.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:get/get.dart';

class Forgetpasswordscreen extends StatelessWidget {
  const Forgetpasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password",
              style: Theme.of(context).textTheme.titleMedium),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(fSizes.defaultSpace),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Please enter your email address below to receive your change password link",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Email Address"),
                              Form(
                                key: controller.forgetPasswordFormKey,
                                child: TextFormField(
                                  controller: controller.email,
                                  validator: fValidator.validateEmail,
                                  cursorColor: Colors.red,
                                  expands: false,
                                  decoration: InputDecoration(
                                      focusedBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      //labelText: "Email Address",
                                      hintText: "Enter your Email",
                                      hintStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      prefixIcon: const Icon(
                                        Icons.email_rounded,
                                        color: Colors.red,
                                      )),
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: fColors.error,
                            ),
                            onPressed: () =>
                                controller.sendPasswordResetEmail(),
                            child: const Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ]))));
  }
}
