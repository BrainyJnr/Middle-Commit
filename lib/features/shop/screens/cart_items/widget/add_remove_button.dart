import 'package:amazing/utilis/constants/fsize.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/icons/cart_circular_icon.dart';

class fProductQuatityaddandremovebutton extends StatelessWidget {
  const fProductQuatityaddandremovebutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 15,
        right: 10,
        child: Row(children: [
          const SizedBox(
            width: 70,
          ),Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                fCircularCartIcon(
                  width: 32,
                  height: 32,
                  size: fSizes.md,
                  backgroundColor: Colors.white,
                  icon: Iconsax.minus,
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  color: Colors.black,
                ),
                const SizedBox(width: 8),
                Text(
                  "2",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  width: fSizes.spaceBtwItems,
                ),
                fCircularCartIcon(
                  icon: Iconsax.add,
                  width: 32,
                  height: 32,
                  size: fSizes.md,
                  backgroundColor: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  color: Colors.black,
                )
              ])])
    );
  }
}
