import 'package:amazing/features/authentication/controllers/user_controller.dart';
import 'package:amazing/features/shop/shimmereffect/fshimmer_effect.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/text_strings.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fApp_bar.dart';

class fHomeAppbar extends StatelessWidget {
  const fHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final controllerUpload = Get.put(dummyRepository());
    final dark = fHelperFunctions.isDarkMode(context);
    final controller = Get.put(UserController());
    return fAppBar(
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Obx(
          () {
            if (controller.profileLoading.value) {
              // Display a Shimmer loader while user profile is being loaded
              return const fShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .apply(
              color: dark ? fColors.white : fColors.black),
              );
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Text(
            fTexts.homeAppBaeSubTitle,
            style: TextStyle(
                fontSize: 12, color: dark ? fColors.white : fColors.black),
          ),
        ),
      ]),
      actions: [
        Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(80)),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
                color: Colors.red,
              ),
            ))
      ],

      //            Container(
      //                 width: 40,
      //                 height: 40,
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(100),
      //                     color: Colors.redAccent.withOpacity(0.2)),
      //                 child: Icon(
      //                   Icons.search_rounded,
      //                   color: Colors.red,
      //                 ))          ])),
    );
  }
}
