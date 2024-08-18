
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/fsize.dart';
import 'package:amazing/utilis/validators/fvalidators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/appbar/fApp_bar.dart';
import '../../../../common/widget/profile_tile/edit_profile_tile.dart';
import '../../../authentication/controllers/update_name_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
        appBar: fAppBar(
          showBackArrow: true,
          title: Text(
            "My Profile",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
              const edit_profile_tile(),
              Padding(
                  padding: EdgeInsets.only(
                      top: 0,
                      left: fSizes.defaultSpace,
                      right: fSizes.defaultSpace,
                      bottom: fSizes.defaultSpace),
                  child: Form(
                      key: controller.updateUserNameFormKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Full Name"),
                            TextFormField(
                              controller: controller.fullName,
                              validator: (value) => fValidator.validateEmptyText("Full Name", value),
                              cursorColor: Colors.red,
                              expands: false,
                              decoration: InputDecoration(
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red)),
                                  hintText: "Enter your full Name",
                                  hintStyle: Theme.of(context).textTheme.bodySmall,
                                  prefixIcon: const Icon(
                                    Iconsax.user,
                                    color: Colors.red,
                                  )),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text("Mobile Number"),
                            TextFormField(
                           //   controller: controller.phoneNumber,
                              cursorColor: Colors.red,
                              expands: false,
                              decoration: InputDecoration(
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red)),
                                  hintText: "Enter your Phone Number",
                                  hintStyle: Theme.of(context).textTheme.bodySmall,
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: Colors.red,
                                  )),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text("Email Address"),
                            TextFormField(
                            //  controller: controller.,
                              cursorColor: Colors.red,
                              expands: false,
                              decoration: InputDecoration(
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red)),
                                  hintText: "Enter your Email",
                                  hintStyle: Theme.of(context).textTheme.bodySmall,
                                  prefixIcon: const Icon(
                                    Icons.email_rounded,
                                    color: Colors.red,
                                  )),
                            ),
                          ]))),
              const SizedBox(
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.all(33),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: fColors.error,
                      ),
                      onPressed: () => controller.updateUserName(),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ) ])));
  }
}


