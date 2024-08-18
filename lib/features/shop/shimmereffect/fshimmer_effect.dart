import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class fShimmerEffect extends StatelessWidget {
  const fShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 25,
    this.color,


  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor : dark ? Colors.grey[850]! :Colors.grey,
        highlightColor:  dark ? Colors.grey[700]! : Colors.grey,
        child : Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? (dark ? fColors.darkGrey : fColors.white),
            borderRadius: BorderRadius.circular(radius),
          ),
        )
    );
  }
}
