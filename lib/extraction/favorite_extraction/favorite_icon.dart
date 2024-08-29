import 'package:amazing/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../common/widgets/icons/f_circular_icon.dart';
import 'controler/favorite_controller.dart';

class fcircular_favorite_icon extends StatelessWidget {
  const fcircular_favorite_icon({
    super.key,
    required this.dark, required this.productId,
  });

  final bool dark;
  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return Obx(
      () =>  fCircularIcon(
        icon: controller.isFavorites(productId) ? Iconsax.heart5 : Iconsax.heart,backgroundColor: Colors.red,
        color: controller.isFavorites(productId) ? dark ? fColors.black : fColors.error : null,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}
