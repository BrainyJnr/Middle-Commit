import 'package:flutter/cupertino.dart';


class fSizes {
  static double defaultSpace = 16.0;
  static double md = 16.0;
  static double spaceBtwItems = 8.0;

  static double getResponsiveWidth(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.width * fraction;
  }
}
