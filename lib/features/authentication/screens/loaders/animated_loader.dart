import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/fsize.dart';
import 'package:flutter/material.dart';




class fAnimationLoaderWidget extends StatelessWidget {






  const fAnimationLoaderWidget ({
    super.key,
    required this.text,
    // this.animation,
    // required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
    required this.image,

  });
  final String text;
  // final String? animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/loaders/Animation - 1717608048132.gif")),
              // Lottie.asset(animation,width: MediaQuery.of(context).size.width * 0.8),
               SizedBox(height: fSizes.defaultSpace,),
              Text(text,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
               SizedBox(height: fSizes.defaultSpace,),
              showAction ? SizedBox(width: 250,
                child: OutlinedButton(
                  onPressed: onActionPressed,
                  style: OutlinedButton.styleFrom(backgroundColor: fColors.dark),
                  child: Text(
                    actionText!,
                    style: Theme.of(context).textTheme.bodySmall!.apply(color: fColors.light),
                  ),
                ),
              )
                  : const SizedBox()

            ])
    );
  }}