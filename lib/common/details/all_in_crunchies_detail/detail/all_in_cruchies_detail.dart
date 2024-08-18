import 'package:amazing/common/details/all_in_crunchies_detail/detail/allInCrunchiesImage.dart';
import 'package:amazing/common/details/all_in_crunchies_detail/detail/all_in_cruchies_imagecontroller.dart';
import 'package:amazing/common/details/all_in_crunchies_detail/detail/all_incrunchies_metadata.dart';
import 'package:amazing/common/widgets/heading/fSection_Heading.dart';
import 'package:amazing/features/personalization/models/crunches_model.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import 'allincrunchies_bottom_add_to_cart.dart';




class AllInCruchiesDetailScreen extends StatelessWidget {
  const AllInCruchiesDetailScreen({super.key, required this.crunchy});

  final CrunchesModel crunchy;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllInCrunchiesImageController());
    return Scaffold(
      bottomNavigationBar: AllInCruchiesbottomAddToCart(crunchy: crunchy),
      body: SingleChildScrollView(
          child: Column(children: [
            AllInCrunchiesDetailImage(crunchy: crunchy,),

            /// --- Detail Name
            const Padding(padding: EdgeInsets.only(bottom: 5)),

            /// --- Price,Title
            AllInCruchiesMetaData(crunchy: crunchy),
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
                crunchy.description ?? "",
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
