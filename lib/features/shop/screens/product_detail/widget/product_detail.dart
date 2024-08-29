import 'package:amazing/common/widgets/heading/fSection_Heading.dart';
import 'package:amazing/features/fetching/detail_screen/image_controller.dart';
import 'package:amazing/features/shop/screens/product_detail/widget/product_meta.dart';
import 'package:amazing/utilis/constants/fsize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../personalization/models/food_model.dart';
import 'bottom_add_to_cart.dart';
import 'detail_image.dart';


class ProductDetailScreen extends StatelessWidget {
  final FoodModel foods;

  const ProductDetailScreen({super.key, required this.foods});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final images = controller.getFoodImages(foods);

    return Scaffold(
      bottomNavigationBar: fBottomAddToCart(foods: foods),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailImage(foods: foods),
            const SizedBox(height: 5),
            fProductMetaData(foods: foods),
            const SizedBox(height: 6),
            const fSectionHeading(title: "Description", showActionButton: false),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ReadMoreText(
                foods.description ?? "",
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Show more",
                trimExpandedText: "Show less",
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
             SizedBox(height: fSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
