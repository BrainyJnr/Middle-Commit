import 'package:amazing/features/crunches/crunches_controller.dart';
import 'package:amazing/features/personalization/models/crunches_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/food_price/food_price.dart';

class AllInCrunchiesMetaData extends StatelessWidget {
  const  AllInCrunchiesMetaData({super.key, required this.crunchy});

  final CrunchesModel crunchy;

  @override
  Widget build(BuildContext context) {
    final controller = Crunchies_Controller.instance;
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  crunchy.title,
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
                    price: controller.getCrucnesPrice(crunchy),
                  )
                ],
              ))
        ]);
  }
}