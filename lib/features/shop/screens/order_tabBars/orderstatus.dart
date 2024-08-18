import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../common/container/rounded_container.dart';
import '../../../../common/food_price/food_price.dart';
import '../../../../common/widgets/image/all_in_crunches_images.dart';
import '../../../../common/widgets/title_text/food_title_text.dart';
import '../../../../utilis/constants/enums.dart';

class OrderStatusView extends StatelessWidget {
  final OrderStatus status;

  const OrderStatusView(this.status, {super.key});

  @override
  Widget build(BuildContext context) {
    final OrderStatus status;
    final dark = fHelperFunctions.isDarkMode(context);

    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 22, top: 10, right: 16),
                child: Column(children: [
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: 2,
                      separatorBuilder: (context, index) =>
                          const SizedBox(
                            height: fSizes.spaceBtwItems,
                          ),
                      itemBuilder: (_, __) =>
                          SizedBox(
                              width: 100,
                              height: 110,
                              child: Container(
                                  width: 320,
                                  height: 160,
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey
                                        .withOpacity(0.4)),
                                    borderRadius: BorderRadius.circular(5),
                                    color: dark ? fColors.black : fColors.white,
                                  ),
                                  child: Stack(children: [

                                    ///  Image
                                    fRoundedContainer(
                                      height: 130,
                                      padding: const EdgeInsets.all(fSizes.sm),
                                      backgroundColor: dark ? fColors.black : fColors.white,
                                      child: const fAllInCrunches(
                                          width: 85,
                                          height: 120,
                                          fit: BoxFit.cover,
                                          image: fImages.ChocolatePlum),
                                    ),

                                    /// Title and Price
                                    Column(children: [
                                      const SizedBox(
                                        width: 267,
                                      ),
                                      const Padding(
                                          padding:
                                          EdgeInsets.only(
                                              top: 15, left: fSizes.sm),
                                          child: fFoodTitleText(
                                              title: "Red Velvet")),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 12),
                                        child: foodprice(
                                          price: "1000",
                                        ),
                                      ), Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              top: 4, left: 0, right: 5),
                                          child: Text("Delivered", style: Theme
                                              .of(context)
                                              .textTheme
                                              .labelMedium!
                                              .apply(color: Colors.black54),)

                                      ), Padding(
                                        padding:
                                        const EdgeInsets.only(
                                            top: 0, left: 80, bottom: 5),
                                        child: Text("(2 August 2024 7:45 PM)",
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .labelMedium!
                                              .apply(color: Colors.black54),),

                                      ),
                                    ])
                                  ])
                              )
                          ))
                ]))));
  }
}
