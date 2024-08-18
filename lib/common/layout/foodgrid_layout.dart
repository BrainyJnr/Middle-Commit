import 'package:amazing/common/all_in_crunches/widget/crunches_food_listview.dart';
import 'package:amazing/features/crunches/crunches_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../all_in_crunches/food_all_in_crunches.dart';

class foogrid_view_layout extends StatelessWidget {
  const foogrid_view_layout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 250,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Crunchies_Controller());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          itemCount: itemCount,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: mainAxisExtent,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          itemBuilder: itemBuilder,
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(right: 230),
          child: Row(
            children: [
              Text(
                "All in Crunchies",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.all(0),
          child: Obx(() {
            //if (controller.isLoading.value) return fVerticalProductshimmer();

            if (controller.featuredCrunches.isEmpty) {
              return const Center(
                  child: Text(
                "No data found",
                style: TextStyle(color: Colors.black),
              ));
            }

            return food_list_view_seperated(
              itemCount: controller.featuredCrunches.length,
              itemBuilder: (_, index) => food_all_in_crunches(
                crunch: controller.featuredCrunches[index],
              ),
            );
          }),
        )
      ],
    );
  }
}
