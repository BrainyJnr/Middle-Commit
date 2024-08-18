import 'package:amazing/features/fetching/controller/banner_controller.dart';
import 'package:amazing/features/shop/shimmereffect/fshimmer_effect.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../image/fRounded_Image.dart';

class fpromoslider extends StatelessWidget {
  const fpromoslider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        if(controller.isLoading.value) return const fShimmerEffect(width: double.infinity, height: 190);

        /// No data found
        if(controller.banners.isEmpty) {
          return const Center(child: Text("No Data Found"));
        } else {
          return CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                // Change this to set how often images change
                autoPlayAnimationDuration: const Duration(milliseconds: 17),
                // Duration for transition effect
                viewportFraction: 1,
                autoPlayCurve: Curves.fastOutSlowIn,
                //autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                //reverse: true,
                enableInfiniteScroll: false,
                scrollDirection: Axis.vertical,
              ),
              items: controller.banners
                  .map((banner) =>
                  fRoundedImage(
                    imageUrl: banner.image,
                    isNetworkImage: true,
                  ))
                  .toList());
        }},
    );
  }
}
