import 'package:amazing/features/fetching/controller/drink_controller.dart';
import 'package:amazing/features/fetching/model/drink_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/food_price/food_price.dart';

class DrinkMetaData extends StatelessWidget {
  const  DrinkMetaData({super.key, required this.drink});

  final DrinkModel drink;

  @override
  Widget build(BuildContext context) {
    final controller = Drink_Controller.instance;
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  drink.title,
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
                    price: controller.getFoodPrice(drink),
                  )
                ],
              ))
        ]);
  }
}