import 'package:amazing/common/details/bread_detail/bread_detail_screen.dart';
import 'package:amazing/common/details/cakes_detail/cakes_detail_screen.dart';
import 'package:amazing/common/details/drink_detail/drink_detail_screen.dart';
import 'package:amazing/common/details/icecreamdetails/icecream_detail_screen.dart';
import 'package:amazing/common/details/promo_detail/promo_detail_screen.dart';
import 'package:amazing/common/details/shawarma/shawarma_detail_screen.dart';
import 'package:amazing/features/fetching/model/bread_model.dart';
import 'package:amazing/features/fetching/model/cake_model.dart';
import 'package:amazing/features/fetching/model/drink_model.dart';
import 'package:amazing/features/fetching/model/icecream_model.dart';
import 'package:amazing/features/fetching/model/promo_model.dart';
import 'package:amazing/features/fetching/model/sharwama_model.dart';
import 'package:amazing/features/personalization/models/food_model.dart';
import 'package:amazing/features/search/search_controller.dart';
import 'package:amazing/features/shop/screens/product_detail/widget/product_detail.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/details/details_protein/protein_detail.dart';
import '../../common/details/pastry_details/pastry_detail_Screen.dart';
import '../fetching/model/pastry_model.dart';
import '../personalization/models/protein_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = Get.put(SearchPage());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Let's find you the best food",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Iconsax.search_favorite,
                  color: fColors.error,
                ),
                suffixIcon: Icon(
                  Icons.arrow_forward_rounded,
                  color: fColors.error,
                ),
                hintText: "Start searching...",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              ),
              onChanged: (value) {
                searchController.search(value);
              },
              onFieldSubmitted: (value) {
                searchController.search(value);
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              if (searchController.searchResults.isNull) {
                return Center(child: Text('No results found.'));
              }

              return ListView.builder(
                itemCount: searchController.searchResults.length,
                itemBuilder: (context, index) {
                  var result = searchController.searchResults[index];

                  if (result is FoodModel) {
                    return InkWell(
                      onTap: () {
                        Get.to(ProductDetailScreen(foods: result));
                      },
                      child: ListTile(
                        //  leading: Image.network(result., fit: BoxFit.cover),
                        title: Text(result.title),
                        subtitle: Text('\$${result.price?.toStringAsFixed(2)}'),
                      ),
                    );
                  } else if (result is ProteinModel) {
                    return InkWell(
                      onTap: () {
                        Get.to(ProteinDetailScreen(protein: result));
                      },
                      child: ListTile(
                        // leading: Image.network(result.imageUrl, fit: BoxFit.cover),
                        title: Text(result.title),
                        subtitle: Text('\$${result.price?.toStringAsFixed(0)}'),
                      ),
                    );
                  } else if (result is PastryModel) {
                    return InkWell(
                      onTap: () {
                        Get.to(PastryDetailScreen(pastry: result));
                      },
                      child: ListTile(
                        //  leading: Image.network(result.imageUrl, fit: BoxFit.cover),
                        title: Text(result.title),
                        subtitle: Text('\$${result.price?.toStringAsFixed(0)}'),
                      ),
                    );
                  } else if (result is CakeModel) {
                    return InkWell(
                      onTap: () {
                        Get.to(CakeDetailScreen(cake: result));
                      },
                      child: ListTile(
                        //  leading: Image.network(result.imageUrl, fit: BoxFit.cover),
                        title: Text(result.title),
                        subtitle: Text('\$${result.price?.toStringAsFixed(0)}'),
                      ),
                    );
                  } else if (result is BreadModel) {
                    return InkWell(
                      onTap: () {
                        Get.to(BreadDetailScreen(bread: result));
                      },
                      child: ListTile(
                        //  leading: Image.network(result.imageUrl, fit: BoxFit.cover),
                        title: Text(result.title),
                        subtitle: Text('\$${result.price?.toStringAsFixed(0)}'),
                      ),
                    );
                  } else if (result is IceModel) {
                    return InkWell(
                      onTap: () {
                        Get.to(IceDetailScreen(ice: result));
                      },
                      child: ListTile(
                        //  leading: Image.network(result.imageUrl, fit: BoxFit.cover),
                        title: Text(result.title),
                        subtitle: Text('\$${result.price?.toStringAsFixed(0)}'),
                      ),
                    );
                  } else if (result is shawarmaModel) {
                    return InkWell(
                      onTap: () {
                        Get.to(ShawarmaDetailScreen(warma: result));
                      },
                      child: ListTile(
                        //  leading: Image.network(result.imageUrl, fit: BoxFit.cover),
                        title: Text(result.title),
                        subtitle: Text('\$${result.price?.toStringAsFixed(0)}'),
                      ),
                    );
                  } else if (result is PromoModel) {
                    return InkWell(
                      onTap: () {
                        Get.to(PromoDetailScreen(promo: result));
                      },
                      child: ListTile(
                        //  leading: Image.network(result.imageUrl, fit: BoxFit.cover),
                        title: Text(result.title),
                        subtitle: Text('${result.price?.toStringAsFixed(0)}'),
                      ),
                    );
                  } else if (result is DrinkModel) {
                    return InkWell(
                      onTap: () {
                        Get.to(DrinkDetailScreen(drink: result));
                      },
                      child: ListTile(
                        //  leading: Image.network(result.imageUrl, fit: BoxFit.cover),
                        title: Text(result.title),
                        subtitle: Text('\$${result.price?.toStringAsFixed(0)}'),
                      ),
                    );
                  } else {
                    return SizedBox.shrink(); // In case of an unexpected type
                  }
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
