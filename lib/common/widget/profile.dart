import 'package:amazing/common/appbar/fApp_bar.dart';
import 'package:amazing/common/widget/profile_tile/user_profile_tile.dart';
import 'package:amazing/features/shop/screens/profile/edit_profile.dart';
import 'package:amazing/features/shop/screens/settings/settings_menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/repositories/authentication_repositories.dart';
import '../../utilis/theme/Theme_data.dart';
import '../widgets/heading/fSection_Heading.dart';
import 'package:amazing/utilis/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    final controller = Get.put(AuthenticationRepository());
    return Scaffold(
      appBar: fAppBar(
        title: Text(
          "Profile",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        const user_profile(),
        const Padding(padding: EdgeInsets.only(left: 12)),

        const SizedBox(
          height: 7,
          width: 10,
        ),
        const fSectionHeading(
          title: "My Account",
          showActionButton: false,
        ),
        const SizedBox(
          height: fSizes.spaceBtwItems,
        ),

        // fProfileMenu(onPressed: (){},icon: Iconsax.user, title: "")
        InkWell(
          child: fSettingsMenuTile(
            icon: Iconsax.user,
            title: "My Profile",
            onTap: () => Get.to(() => const EditProfileScreen()),
            trailing: const Icon(
              Iconsax.arrow_right_34,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),

        const fSectionHeading(
          title: "More",
          showActionButton: false,
        ),
        const SizedBox(
          height: 5,
        ),
        const fSettingsMenuTile(
          icon: Iconsax.call,
          title: "Support",
          trailing: Icon(
            Iconsax.arrow_right_34,
          ),
        ),
        InkWell(
          onTap: () {
            themeController.toggleTheme(); // Toggle the theme on tap
          },
          child: fSettingsMenuTile(
            title: themeController.isDarkMode.value
                ? "Turn the light on"
                : "Go dark",
            icon: themeController.isDarkMode.value
                ? Iconsax.moon
                : Iconsax.sun_14,
            trailing: const Icon(Iconsax.arrow_right_34),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        InkWell(
            child: fSettingsMenuTile(
          icon: Iconsax.logout,
          onTap: () {
            controller.logout();
          },
          title: "Log out",
          trailing: const Icon(Iconsax.arrow_right_34),
        ))
      ])),
    );
  }
}
