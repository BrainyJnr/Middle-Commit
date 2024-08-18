import 'package:amazing/common/details/promo_detail/promo_bottom_addto_cart.dart';
import 'package:amazing/common/details/promo_detail/promo_detail_image.dart';
import 'package:amazing/common/details/promo_detail/promo_image_controller.dart';
import 'package:amazing/common/details/promo_detail/promo_meta_data.dart';
import 'package:amazing/common/widgets/heading/fSection_Heading.dart';
import 'package:amazing/features/fetching/model/promo_model.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';



class PromoDetailScreen extends StatelessWidget {
  const PromoDetailScreen({super.key, required this.promo});

  final PromoModel promo;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PromoImageController());
    return Scaffold(
      bottomNavigationBar: PromoBottomAddToCart(promo: promo),
      body: SingleChildScrollView(
          child: Column(children: [
            PromoDetailImage(promo: promo,),

            /// --- Detail Name
            const Padding(padding: EdgeInsets.only(bottom: 5)),

            /// --- Price,Title
            PromoMetaData(promo: promo),
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
                promo.description ?? "",
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
