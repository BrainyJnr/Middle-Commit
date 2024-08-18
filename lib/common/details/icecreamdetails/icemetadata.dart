import 'package:amazing/features/fetching/controller/icecream_controller.dart';
import 'package:amazing/features/fetching/model/icecream_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/food_price/food_price.dart';

class IceMetaData extends StatelessWidget {
  const   IceMetaData({super.key, required this.ice});

  final IceModel ice;

  @override
  Widget build(BuildContext context) {
    final controller = IceCrean_Controller.instance;
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  ice.title,
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
                    price: controller.getCreamPrice(ice),
                  )
                ],
              ))
        ]);
  }
}