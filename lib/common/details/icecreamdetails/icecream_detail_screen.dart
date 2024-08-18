import 'package:amazing/common/details/icecreamdetails/ice_imageController.dart';
import 'package:amazing/common/details/icecreamdetails/icecreamaddtocartbottom.dart';
import 'package:amazing/common/details/icecreamdetails/icecrean_detailimage.dart';
import 'package:amazing/common/details/icecreamdetails/icemetadata.dart';
import 'package:amazing/common/widgets/heading/fSection_Heading.dart';
import 'package:amazing/features/fetching/model/icecream_model.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';



class IceDetailScreen extends StatelessWidget {
  const IceDetailScreen({super.key, required this.ice});

  final IceModel ice;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IceCreamImageController());
    return Scaffold(
      bottomNavigationBar: IceBottomAddToCart(ice: ice),
      body: SingleChildScrollView(
          child: Column(children: [
            IceDetailImage(ice: ice,),

            /// --- Detail Name
            const Padding(padding: EdgeInsets.only(bottom: 5)),

            /// --- Price,Title
            IceMetaData(ice: ice),
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
                ice.description ?? "",
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
