import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';

class fCircularIcon extends StatelessWidget {
  const fCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = fSizes.bb,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 5,right: 5),
      child: Container(
        height: 34.1,
        width: 34.1,
        padding: const EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon,
            color: color,size: size,)),

      ),
    );
  }
}
