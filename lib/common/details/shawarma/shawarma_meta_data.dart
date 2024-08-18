import 'package:amazing/features/fetching/controller/sharwarma_controller.dart';
import 'package:amazing/features/fetching/model/sharwama_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/food_price/food_price.dart';

class ShawarmaMetaData extends StatelessWidget {
  const  ShawarmaMetaData({super.key, required this.warma});

  final shawarmaModel warma;

  @override
  Widget build(BuildContext context) {
    final controller = shawarma_Controller.instance;
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  warma.title,
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
                    price: controller.getFoodPrice(warma),
                  )
                ],
              ))
        ]);
  }
}