import 'package:amazing/common/details/drink_detail/drink_add_tocart_buttom.dart';
import 'package:amazing/common/details/drink_detail/drink_image_controller.dart';
import 'package:amazing/common/details/drink_detail/drink_meta_data.dart';
import 'package:amazing/common/widgets/heading/fSection_Heading.dart';
import 'package:amazing/features/fetching/model/drink_model.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../features/shop/screens/cart_items/widget/cart/drink_add_to_cart.dart';
import 'drink_detail_image.dart';



class DrinkDetailScreen extends StatelessWidget {
  const DrinkDetailScreen({super.key, required this.drink});

  final DrinkModel drink;

  @override
  Widget build(BuildContext context) {
    // Retrieve the existing DrinkImageController instance
    final DrinkImageController controller = Get.put(DrinkImageController());

    return Scaffold(
      bottomNavigationBar: DrinkbottomAddToCart(drink: drink, ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DrinkDetailImage(drink: drink),

            // Detail Name
            const Padding(padding: EdgeInsets.only(bottom: 5)),

            // Price, Title
            DrinkMetaData(drink: drink),
            const SizedBox(height: 6),

            // Section Heading
            const fSectionHeading(title: "Description", showActionButton: false),
            const SizedBox(height: 5),

            // Description
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ReadMoreText(
                drink.description ?? "",
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Show more",
                trimExpandedText: "show less",
                moreStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                lessStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Spacer
            const SizedBox(height: fSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
