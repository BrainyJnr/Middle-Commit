import 'package:amazing/common/details/details_protein/protein_detail_image.dart';
import 'package:amazing/common/widgets/heading/fSection_Heading.dart';
import 'package:amazing/features/personalization/models/protein_model.dart';

import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import 'fprotein_bottom_cart.dart';
import 'fprotein_meta.dart';
import 'image_controller_protein.dart';


class ProteinDetailScreen extends StatelessWidget {
  final ProteinModel protein;

  ProteinDetailScreen({super.key, required this.protein});

  @override
  Widget build(BuildContext context) {
    final ProteinImageController controller = Get.put(ProteinImageController());

    // Use `WidgetsBinding.instance.addPostFrameCallback` to schedule the data initialization
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final images = controller.getProteinImages(protein);
      // You can perform additional operations with the images here if needed
    });

    return Scaffold(
      bottomNavigationBar: fProteinBottomAddToCart(protein: protein),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProteinDetailImage(protein: protein),

            // Detail Name
            const Padding(padding: EdgeInsets.only(bottom: 5)),

            // Price, Title
            fProtreintMetaData(protein: protein),
            const SizedBox(height: 6),
            const fSectionHeading(title: "Description", showActionButton: false),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ReadMoreText(
                protein.description ?? "",
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
            const SizedBox(height: fSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
