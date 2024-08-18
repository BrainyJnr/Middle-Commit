import 'package:amazing/data/controllers/food_controller.dart';
import 'package:amazing/features/personalization/models/food_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/food_price/food_price.dart';

class fProductMetaData extends StatelessWidget {
  const fProductMetaData({super.key, required this.foods});

  final FoodModel foods;

  @override
  Widget build(BuildContext context) {
    final controller = Food_Controller.instance;
    return Column(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  foods.title,
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
                    price: controller.getFoodPrice(foods),
                  )
                ],
              ))
        ]);
  }
}
