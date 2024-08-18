import 'package:amazing/features/fetching/controller/pastry_controller.dart';
import 'package:amazing/features/fetching/model/pastry_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/food_price/food_price.dart';

class PastrytMetaData extends StatelessWidget {
  const PastrytMetaData({super.key, required this.pastry});

  final PastryModel pastry;

  @override
  Widget build(BuildContext context) {
    final controller = pastry_Controller.instance;
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  pastry.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Row(
                children: [
                  foodprice(
                    price: controller.getFoodPrice(pastry),
                  )
                ],
              ))
        ]);
  }
}