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
    return Text(
      title,
      style: isLarge ?  Theme.of(context).textTheme.labelSmall : Theme.of(context).textTheme.labelMedium,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
