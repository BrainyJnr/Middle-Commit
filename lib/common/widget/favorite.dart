import 'package:amazing/common/widgets/favorites/favorite_2.dart';
import 'package:amazing/extraction/favorite_extraction/controler/favorite_controller.dart';
import 'package:amazing/features/authentication/screens/loaders/animated_loader.dart';
import 'package:amazing/features/fetching/model/all_model.dart';
import 'package:amazing/features/functions/cloudfuunction.dart';
import 'package:amazing/features/shop/shimmereffect/fvertical_shimmer.dart';
import 'package:amazing/navigation/navigation_menu.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../appbar/fApp_bar.dart';
import '../widgets/favorites/fFavorite_list_view_Seperated.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteController.instance;
    return Scaffold(
        appBar: fAppBar(
          title: Text(
            "Favorites",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: fColors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 22, top: 12, right: 16),
          child: SingleChildScrollView(
            child: Obx(
              () => FutureBuilder(
                  future: controller.favoriteProducts(),
                  builder: (context, snapshot) {
                    /// Nothing Found Widget
                    final emptyWidget = fAnimationLoaderWidget(
                      text: "Whoopes Wishlist is Empty...............",
                      image: "assets/loaders/Animation - 1717608048132.gif",
                      showAction: true,
                      actionText: "Let\'s add some",
                      onActionPressed: () => Get.offAll(() => Navigation_Menu()),
                    );

                    const loader = fCategoryShimmer(
                      itemCount: 6,
                    );
                    final widget = fCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: loader,
                        nothingFound: emptyWidget);
                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return favorite_list_view_seperated(
                      itemCount: products.length,
                      itemBuilder: (_, index) => favorite2(
                        all: products[index],
                      ),
                    );
                  }),
            ),
          ),
        ));
  }
}
