import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';

class fCircularCartIcon extends StatelessWidget {
  const fCircularCartIcon({
    super.key,
    this.width,
    this.height,
    this.size = fSizes.bb,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed, this.border,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 5,right: 5),
      child: Container(
        height: 34.1,
        width: 34.1,
        padding: const EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor,
          border: border,


        ),
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon,
              color: color,size: size,)),

      ),
    );
  }
}