import 'package:amazing/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';import 'package:amazing/features/shop/screens/cart_screen.dart';


class fCounterIcon extends StatelessWidget {
  const fCounterIcon({
    super.key, this.iconColor, required this.onPressed,
  });
  final Color? iconColor;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
          onPressed: () => Get.to(const CartScreen()),
          color: Colors.white, icon:   const Icon( Iconsax.shopping_bag,
      )

      ),Positioned(right: 0.1,
        child: Container(
            width: 18,height: 18,
            decoration: BoxDecoration(border: Border.all(color: fColors.white),
                color: fColors.error,borderRadius: BorderRadius.circular(100)
            ),child: Center(
            child: Text ("1",style: Theme.of(context).textTheme.labelLarge!.apply(color: fColors.white,fontSizeFactor: 0.8),
            ))
        ),
      ),
    ]);
  }
}
