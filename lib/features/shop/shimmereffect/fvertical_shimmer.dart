
import 'package:amazing/utilis/constants/fsize.dart';
import 'package:flutter/material.dart';

import '../../../common/layout/foodgrid_layout.dart';
import 'fshimmer_effect.dart';

class fVerticalProductshimmer extends StatelessWidget {
  const fVerticalProductshimmer({super.key,
    this.itemCount = 14,

  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return foogrid_view_layout(itemCount: itemCount, itemBuilder: (_, __) => SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          const fShimmerEffect(width: 180, height: 180,color: Colors.black),
          SizedBox(height: fSizes.spaceBtwItems,),

          /// Text
          const fShimmerEffect(width: 160, height: 15),
          SizedBox(height: fSizes.spaceBtwItems /2,),
          const fShimmerEffect(width: 110, height: 15),
        ],
      ),
    ));
  }
}
