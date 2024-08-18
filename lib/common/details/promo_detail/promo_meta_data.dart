import 'package:amazing/features/fetching/controller/promo_controller.dart';
import 'package:amazing/features/fetching/model/promo_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/food_price/food_price.dart';

class PromoMetaData extends StatelessWidget {
  const  PromoMetaData({super.key, required this.promo});

  final PromoModel promo;

  @override
  Widget build(BuildContext context) {
    final controller = Promo_Controller.instance;
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  promo.title,
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
                    price: controller.getFoodPrice(promo),
                  )
                ],
              ))
        ]);
  }
}