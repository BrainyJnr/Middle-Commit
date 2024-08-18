import 'package:amazing/common/layout/bread_grid_view_layout.dart';
import 'package:amazing/common/layout/cakess_grid_view_layout.dart';
import 'package:amazing/common/layout/drink_grid_view_layout.dart';
import 'package:amazing/common/layout/ice_cream_grid_view_layout.dart';
import 'package:amazing/common/layout/pastry_grid_view_layout.dart';
import 'package:amazing/common/layout/promo_grid_view_layout.dart';
import 'package:amazing/common/layout/protein_grid_view.dart';
import 'package:amazing/common/layout/sharwama_grid_view_layout.dart';
import 'package:amazing/common/widget/bread.dart';
import 'package:amazing/common/widget/cakes.dart';
import 'package:amazing/common/widget/drinks.dart';
import 'package:amazing/common/widget/icecream.dart';
import 'package:amazing/common/widget/pastry.dart';
import 'package:amazing/common/widget/promo.dart';
import 'package:amazing/common/widget/protein.dart';
import 'package:amazing/common/widget/shawarma.dart';
import 'package:amazing/data/controllers/food_controller.dart';
import 'package:amazing/features/fetching/controller/drink_controller.dart';
import 'package:amazing/features/fetching/controller/pastry_controller.dart';
import 'package:amazing/features/fetching/controller/promo_controller.dart';
import 'package:amazing/features/fetching/controller/sharwarma_controller.dart';
import 'package:amazing/features/shop/shimmereffect/fvertical_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/fetching/controller/bread_controller.dart';
import '../../features/fetching/controller/cake_controller.dart';
import '../../features/fetching/controller/icecream_controller.dart';
import '../../features/fetching/controller/protein_controller.dart';
import '../layout/foodgrid_layout.dart';
import 'food_home.dart';

class TabView extends StatelessWidget {
  final int index;

  const TabView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Food_Controller());
    final pastryController = Get.put(pastry_Controller());
    final iceController = Get.put(IceCrean_Controller());
    final breadController = Get.put(Bread_Controller());
    final cakeController = Get.put(Cake_Controller());
    final proteinController = Get.put(Protein_Controller());
    final shawarmaController = Get.put(shawarma_Controller());
    final promoController = Get.put(Promo_Controller());
    final drinkController = Get.put(Drink_Controller());
    List<Widget> tabs = [
      Obx(() {
        if (controller.isLoading.value) return const fVerticalProductshimmer();

        if (controller.featuredProducts.isEmpty) {
          return const Center(
              child: Text(
                "No data found",
                style: TextStyle(color: Colors.black),
              ));
        }
        return foogrid_view_layout(
            itemCount: controller.featuredProducts.length,
            itemBuilder: (_, index) =>
                food(
                  foods: controller.featuredProducts[index],
                ));
      }),
      Obx(() {
        if (controller.isLoading.value) return const fVerticalProductshimmer();

        if (proteinController.featuredProtein.isEmpty) {
          return const Center(
            child: Text(
              "No data found",
              style: TextStyle(color: Colors.black),
            ),
          );
        }
        return proteingrid_view_layout(
            itemCount: proteinController.featuredProtein.length,
            itemBuilder: (_, index) =>
                protein(proteins: proteinController.featuredProtein[index]));
      }),
      Obx(() {
        if (pastryController.isLoading.value) return const fVerticalProductshimmer();

        if (pastryController.featuredPastry.isEmpty) {
          return const Center(
            child: Text(
              "No data found",
              style: TextStyle(color: Colors.black),
            ),
          );
        }
        return pastrygrid_view_layout(
            itemCount: pastryController.featuredPastry.length,
            itemBuilder: (_, index) =>
                pastry(Pastry: pastryController.featuredPastry[index]));
      }),
      Obx(() {
        if (controller.isLoading.value) return const fVerticalProductshimmer();

        if (cakeController.featuredcakes.isEmpty) {
          return const Center(
            child: Text(
              "No data found",
            ),
          );
        }
        return cakesgrid_view_layout(
            itemCount: cakeController.featuredcakes.length,
            itemBuilder: (_, index) =>
                Cakes(
                  cakes: cakeController.featuredcakes[index],
                ));
      }),
      Obx(() {
        if (controller.isLoading.value) return const fVerticalProductshimmer();

        if (breadController.featuredBread.isEmpty) {
          return const Center(
            child: Text("No data found"),
          );
        }
        return breadgrid_viewlayout(
            itemCount: breadController.featuredBread.length,
            itemBuilder: (_, index) =>
                Bread(
                  bread: breadController.featuredBread[index],
                ));
      }),
      Obx(() {
        if (controller.isLoading.value) return const fVerticalProductshimmer();

        if (iceController.featuredIceCream.isEmpty) {
          return const Center(
            child: Text("No data found"),
          );
        }
        return ice_creamgrid_viewlayout(
            itemCount: iceController.featuredIceCream.length,
            itemBuilder: (_, index) =>
                IceCream(
                  Cream: iceController.featuredIceCream[index],
                ));
      }),
      Obx(() {
        if (controller.isLoading.value) return const fVerticalProductshimmer();

        if (shawarmaController.featuredShawar.isEmpty) {
          return const Center(
            child: Text("No data found"),
          );
        }
        return sharwamagrid_viewlayout(
            itemCount: shawarmaController.featuredShawar.length,
            itemBuilder: (_, index) =>
                SHAWARMAR(
                  shawar: shawarmaController.featuredShawar[index],
                ));
      }),
      Obx(() {
        if (controller.isLoading.value) return const fVerticalProductshimmer();

        if (promoController.featuredPromo.isEmpty) {
          return const Center(child: Text("No data found"));
        }
        return promogrid_viewlayout(
            itemCount: promoController.featuredPromo.length,
            itemBuilder: (_, index) =>
                Promo(
                  promo: promoController.featuredPromo[index],

                ));
      }),
      Obx(() {
        if (controller.isLoading.value) return const fVerticalProductshimmer();

        if (drinkController.featuredDrink.isEmpty) {
          return const Center(child: Text("No data found"));
        }
        return
          drinkgrid_viewlayout(itemCount: drinkController.featuredDrink.length, itemBuilder: (_, index) => Drink(
            drink: drinkController.featuredDrink[index],
          ));
      })
    ];
    return tabs[index];
  }
}

//  Home3(),
//  Home4(),
//  Home5(),
//  Home6(),
//  Home7(),
// Home8(),
// Home9(),
