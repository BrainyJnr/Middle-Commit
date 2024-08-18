import 'package:amazing/features/authentication/controllers/user_controller.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../widgets/image/profile_circular_image.dart';

class user_profile extends StatelessWidget {
  const user_profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controler = UserController.instance;
    return ListTile(
      leading: const SizedBox(
          child: fProfile_Circular_Images(
            image: fImages.ProfileLogo,
            fit: BoxFit.fitHeight,
            height: 1000,
          )),
      title: Text(
        controler.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .apply(color: Colors.black),
      ),
      subtitle: Text(controler.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: Colors.black)),
    );
  }
}
