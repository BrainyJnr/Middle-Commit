import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'fshimmer_effect.dart';

class fCategoryShimmer extends StatelessWidget {
  const fCategoryShimmer({
    super.key,
    this.itemCount = 20,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 50,
        child: ListView.separated(
            itemCount: itemCount,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(
              height: fSizes.spaceBtwItems,
            ),
            itemBuilder: (_, __) {
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Image
                  fShimmerEffect(
                      width: 0,
                    height: 40
                //    radius: 55,
                  ),
                  SizedBox(
                    height: fSizes.spaceBtwItems / 2,
                  ),

                  /// Text
                 // fShimmerEffect(width: 55, height: 8),
                ],
              );
            }));
  }
}
