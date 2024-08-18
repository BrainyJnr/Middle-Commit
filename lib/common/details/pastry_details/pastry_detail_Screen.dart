import 'package:amazing/common/details/pastry_details/pastry_bottom_navigation.dart';
import 'package:amazing/common/details/pastry_details/pastry_detail_image.dart';
import 'package:amazing/common/details/pastry_details/pastry_image_controller.dart';
import 'package:amazing/common/details/pastry_details/pastry_meta_data.dart';
import 'package:amazing/common/widgets/heading/fSection_Heading.dart';
import 'package:amazing/features/fetching/model/pastry_model.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';


class PastryDetailScreen extends StatelessWidget {
  const PastryDetailScreen({super.key, required this.pastry});

  final PastryModel pastry;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PastryImageController());
    final images = controller.getPastryImages(pastry);
    return Scaffold(
      bottomNavigationBar: PastryBottomAddToCart(pastry: pastry),
      body: SingleChildScrollView(
          child: Column(children: [
            PastryDetailImage(pastry: pastry,),

            /// --- Detail Name
            const Padding(padding: EdgeInsets.only(bottom: 5)),

            /// --- Price,Title
            PastrytMetaData(pastry: pastry),
            const SizedBox(
              height: 6,
            ),
            const fSectionHeading(title: "Description", showActionButton: false),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: ReadMoreText(
                pastry.description ?? "",
                //style: TextStyle(color: Colors.black54),
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
              ),),

            const SizedBox(
              height: fSizes.spaceBtwSections,
            ),



          ])),
    );
  }
}
