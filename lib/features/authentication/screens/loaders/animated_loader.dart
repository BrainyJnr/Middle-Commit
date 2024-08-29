import 'package:amazing/utilis/constants/colors.dart';
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
              Image(image: AssetImage("assets/loaders/Animation - 1717608048132.gif")),
              // Lottie.asset(animation,width: MediaQuery.of(context).size.width * 0.8),
              const SizedBox(height: 24.0),
              Text(text,style: Theme.of(context).textTheme.titleSmall,textAlign: TextAlign.center,),
              const SizedBox(height: 30.0),
              showAction ? SizedBox(width: 250,height: 50,

                child: ElevatedButton(
                  onPressed: onActionPressed,
                  style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: fColors.dark),
                  child: Text(
                    actionText!,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(color: fColors.light),
                  ),
                ),
              )
                  : const SizedBox()

            ])
    );
  }}