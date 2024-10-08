import 'package:amazing/common/details/cakes_detail/cake_bottom_navigation.dart';
import 'package:amazing/common/details/cakes_detail/cake_detail_controller.dart';
import 'package:amazing/common/details/cakes_detail/cake_detail_image.dart';
import 'package:amazing/common/details/cakes_detail/cake_meta_data.dart';
import 'package:amazing/common/widgets/heading/fSection_Heading.dart';
import 'package:amazing/features/fetching/model/cake_model.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';


class CakeDetailScreen extends StatelessWidget {
  const CakeDetailScreen({super.key, required this.cake});

  final CakeModel cake;

  @override
  Widget build(BuildContext context) {
    // Use Get.find() to retrieve the existing controller instance
    final CakeImageController controller = Get.put(CakeImageController());

    // Fetch images from the controller
    final images = controller.getCakeImages(cake);

    return Scaffold(
      bottomNavigationBar: CakeBottomAddToCart(cake: cake),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CakeDetailImage(cake: cake),

            // Detail Name
            const Padding(padding: EdgeInsets.only(bottom: 5)),

            // Price, Title
            CakeMetaData(cake: cake),
            const SizedBox(height: 6),

            // Section Heading
            const fSectionHeading(title: "Description", showActionButton: false),
            const SizedBox(height: 5),

            // Description
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ReadMoreText(
                cake.description ?? "",
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
