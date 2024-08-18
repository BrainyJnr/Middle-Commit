import 'package:amazing/features/fetching/controller/bread_controller.dart';
import 'package:amazing/features/fetching/model/bread_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/food_price/food_price.dart';

class BreadMetaData extends StatelessWidget {
  const   BreadMetaData({super.key, required this.bread});

  final BreadModel bread;

  @override
  Widget build(BuildContext context) {
    final controller = Bread_Controller.instance;
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  bread.title,
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
                    price: controller.getFoodPrice(bread),
                  )
                ],
              ))
        ]);
  }
}