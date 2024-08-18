import 'package:amazing/features/fetching/controller/cake_controller.dart';
import 'package:amazing/features/fetching/model/cake_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/food_price/food_price.dart';

class CakeMetaData extends StatelessWidget {
  const   CakeMetaData({super.key, required this.cake});

  final CakeModel cake;

  @override
  Widget build(BuildContext context) {
    final controller = Cake_Controller.instance;
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  cake.title,
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
                    price: controller.getFoodPrice(cake),
                  )
                ],
              ))
        ]);
  }
}