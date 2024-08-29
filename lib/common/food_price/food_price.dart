import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class foodprice extends StatelessWidget {
  const foodprice({
    super.key,

    this.currencySign = "",
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,

  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
        currencySign + price,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: isLarge
            ? Theme.of(context).textTheme.labelLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.titleMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
    );
  }
}

class foodprices extends StatelessWidget {
  const foodprices({
    super.key,

    this.currencySign = "\u20A6",
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,

  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return Text(
        currencySign + price,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: isLarge
            ? Theme.of(context).textTheme.labelSmall!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.labelSmall!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null,color: dark ? Colors.white : Colors.black.withOpacity(0.5))
    );
  }
}
