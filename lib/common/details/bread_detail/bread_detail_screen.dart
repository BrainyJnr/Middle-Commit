import 'package:amazing/common/details/bread_detail/bread_bottom_navigation.dart';
import 'package:amazing/common/details/bread_detail/bread_image_detail.dart';
import 'package:amazing/common/details/bread_detail/bread_meta.dart';
import 'package:amazing/common/widgets/heading/fSection_Heading.dart';
import 'package:amazing/features/fetching/model/bread_model.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import 'bread_image_controller.dart';


class BreadDetailScreen extends StatelessWidget {
  const BreadDetailScreen({super.key, required this.bread});

  final BreadModel bread;

  @override
  Widget build(BuildContext context) {
    // Retrieve the existing controller instance
    final BreadImageController controller = Get.put(BreadImageController());

    // Uncomment if you need to use images
    // final images = controller.getBreadImages(bread);

    return Scaffold(
      bottomNavigationBar: BreadBottomAddToCart(bread: bread),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BreadDetailImage(bread: bread),

            // Detail Name
            const Padding(padding: EdgeInsets.only(bottom: 5)),

            // Price, Title
            BreadMetaData(bread: bread),
            const SizedBox(height: 6),

            // Section Heading
            const fSectionHeading(title: "Description", showActionButton: false),
            const SizedBox(height: 5),

            // Description
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ReadMoreText(
                bread.description ?? "",
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
