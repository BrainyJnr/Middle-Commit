import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class fCircular_Images_Cayegories extends StatelessWidget {
  const fCircular_Images_Cayegories({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 20,
    AssetImage = false,
    this.height = 30,
    this.padding = fSizes.sm


  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding:  EdgeInsets.all(padding),
        decoration: BoxDecoration(
          //color: backgroundColor ?? (fHelperFunctions.isDarkMode(context) ? fColors.black : fColors.white),
            borderRadius: BorderRadius.circular(1)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          //  child: Center(
          child: Image(   fit: fit,
            image:  AssetImage(image),
            color: overlayColor,

          ),)
    );
  }
}
