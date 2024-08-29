import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class fFoodTitleText extends StatelessWidget {
  const fFoodTitleText({super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,  this.isLarge = false,


  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;
  final bool isLarge;


  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Text(
      title,
      style: isLarge ?  Theme.of(context).textTheme.labelSmall : Theme.of(context).textTheme.labelMedium!.apply(color: dark ? Colors.white : Colors.black ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
