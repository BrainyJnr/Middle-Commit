import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../features/authentication/controllers/user_controller.dart';
import '../../widgets/image/fcircular_image.dart';

class edit_profile_tile extends StatelessWidget {
  const edit_profile_tile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controler = UserController.instance;
    return ListTile(
      leading: const SizedBox(
          child: fCircular_Images(
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
