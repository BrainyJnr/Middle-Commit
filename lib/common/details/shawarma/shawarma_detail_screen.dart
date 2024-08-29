import 'package:amazing/common/details/shawarma/shawarma_add_to_cart_button.dart';
import 'package:amazing/common/details/shawarma/shawarma_detailimage.dart';
import 'package:amazing/common/details/shawarma/shawarma_imagecontroller.dart';
import 'package:amazing/common/details/shawarma/shawarma_meta_data.dart';
import 'package:amazing/common/widgets/heading/fSection_Heading.dart';
import 'package:amazing/features/fetching/model/sharwama_model.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';



class ShawarmaDetailScreen extends StatelessWidget {
  const ShawarmaDetailScreen({super.key, required this.warma});

  final shawarmaModel warma;

  @override
  Widget build(BuildContext context) {
    // Retrieve the existing ShawarmaImageController instance
    final ShawarmaImageController controller = Get.put(ShawarmaImageController());

    return Scaffold(
      bottomNavigationBar: ShawarmaBottomAddToCart(warma: warma),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ShawarmaDetailImage(warma: warma),

            // Detail Name
            const Padding(padding: EdgeInsets.only(bottom: 5)),

            // Price, Title
            ShawarmaMetaData(warma: warma),
            const SizedBox(height: 6),

            // Section Heading
            const fSectionHeading(title: "Description", showActionButton: false),
            const SizedBox(height: 5),

            // Description
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ReadMoreText(
                warma.description ?? "",
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
